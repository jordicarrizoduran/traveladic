import 'package:flutter/material.dart';
import 'package:traveladic_app/models/trips_model.dart';
import 'package:traveladic_app/services/trips_service.dart';

class TripsData extends ChangeNotifier {
  List<Trips>? trips;

  TripsData() {
    init();
  }

  Future<void> init() async {
    trips = await TripsService().fetchData();
    notifyListeners();
  }
}
