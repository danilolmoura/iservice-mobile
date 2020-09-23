import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:iservice_mobile/screens/search.dart';
import 'package:iservice_mobile/services/geolocator_service.dart';
import 'package:iservice_mobile/services/places_services.dart';
import 'package:provider/provider.dart';

import 'models/place.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final locatorService = GeolocatorService();
  final placesServices = PlacesServices();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider(
          create: (context) => locatorService.getLocation(),
        ),
        ProxyProvider<Position, Future<List<Place>>>(
          update: (context, position, places) {
            return (position != null)
                ? placesServices.getPlacess(
                    position.latitude, position.longitude)
                : null;
          },
        )
      ],
      child: MaterialApp(
        title: 'Iservice App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Search(),
      ),
    );
  }
}
