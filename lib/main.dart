import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:proxy_provider/screens/welcome.dart';
import 'package:proxy_provider/services/geolocator_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GeoLocatorService _geoService = GeoLocatorService();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider(create: (context) => _geoService.getCoords()),
        ProxyProvider<Position, Future<List<Placemark>>>(
            update: (context, position, placemark) =>
                (position != null) ? _geoService.getAddress(position) : null)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(bodyText2: TextStyle(fontSize: 20.0)),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Welcome(),
      ),
    );
  }
}
