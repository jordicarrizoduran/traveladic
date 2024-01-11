import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/trips_model.dart';

class TripsService {
  Future<List<Trips>> fetchData() async {
    var response = await http.get(Uri.parse('https://traveladic.com/data-app/trips.json'));
    final decodedResponse = utf8.decode(response.bodyBytes);
    final trips = tripsFromJson(decodedResponse);
    return trips;
  }
}