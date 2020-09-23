import 'package:iservice_mobile/models/place.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesServices {
  final key = 'AIzaSyACEA4v57gd4lMmfg1fwWcmHKXXLiAFZZU';

  Future<List<Place>> getPlacess(double lat, double lng) async {
    var response = await http.get(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=parking&rankby=distance&key=$key');
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    jsonResults.map((place) => Place.fromJson(place)).toList();
  }
}
