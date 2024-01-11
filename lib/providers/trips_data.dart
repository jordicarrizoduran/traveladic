import 'package:flutter/material.dart';

class TripsData extends ChangeNotifier {
  List<String> favorites = [];

  void toggleFavorite(String id){
    if (favorites.contains(id)) {
      favorites.remove(id);
    } else {
      favorites.add(id);
    }
  }



}