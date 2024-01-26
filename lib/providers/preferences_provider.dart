import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traveladic_app/models/trips_model.dart';
import 'package:traveladic_app/services/trips_service.dart';

class PreferencesProvider extends ChangeNotifier {
  late SharedPreferences sharedPreferences;
  Map<String, List<String>> checkMap = {};
  List<String> favoriteTrips = [];
  //La clau del map serà això tripCode

  PreferencesProvider() {
    init();
  }

  init() async {
    sharedPreferences = await SharedPreferences.getInstance();

    List<Trips> trips = await TripsService().fetchData();

    for (var trip in trips) {
      var tripData = sharedPreferences.getStringList(trip.id);
      if (tripData != null) {
        checkMap[trip.id] = tripData;
      }
    }
    var favoriteData = sharedPreferences.getStringList("favorites");
    if (favoriteData != null) {
      favoriteTrips = favoriteData;
    }
    notifyListeners();
  }

  Future<void> addFavorite(String tripId) async {
    if (!favoriteTrips.contains(tripId)) {
      favoriteTrips.add(tripId);
    }
    await sharedPreferences.setStringList("favorites", favoriteTrips);
    notifyListeners();
  }

  Future<void> removeFavorite(String tripId) async {
    if (favoriteTrips.contains(tripId)) {
      favoriteTrips.remove(tripId);
    }
    await sharedPreferences.setStringList("favorites", favoriteTrips);
    notifyListeners();
  }

  Future<void> toggleFavorite(String tripId) async {
    if (isFavorite(tripId)) {
      await removeFavorite(tripId);
    } else {
      await addFavorite(tripId);
    }
  }

  bool isFavorite(String tripId) {
    return (favoriteTrips.contains(tripId));
  }

  Future<void> setIsChecked(
      String tripKey, String essential, bool value) async {
    if (checkMap[tripKey] == null) checkMap[tripKey] = [];
    if (value) {
      if (!checkMap[tripKey]!.contains(essential)) {
        checkMap[tripKey]!.add(essential);
      }
    }
    if (!value) {
      if (checkMap[tripKey]!.contains(essential)) {
        checkMap[tripKey]!.remove(essential);
      }
    }
    sharedPreferences.setStringList(tripKey, checkMap[tripKey]!);
    notifyListeners();
  }

  bool isChecked(String tripKey, String essential) {
    return checkMap[tripKey]?.contains(essential) ?? false;
  }
}
