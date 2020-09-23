import 'package:flutter/material.dart';
import 'package:iservice_mobile/screens/search.dart';
import 'package:iservice_mobile/services/geolocator_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final locatorService = GeolocatorService();

  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => locatorService.getLocation(),
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
