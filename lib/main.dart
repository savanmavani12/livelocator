import 'package:flutter/material.dart';
import 'package:live_locator/screens/HomePage.dart';
import 'package:live_locator/screens/map_page.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/" : (context) => const HomePage(),
        "Map" : (context) => const MapPage(),
      },
    ),
  );
}
