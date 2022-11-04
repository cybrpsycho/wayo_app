import 'dart:convert';

import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'AvantGarde',
  colorScheme: const ColorScheme.light(primary: Color(0xFF474d61)),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    scrolledUnderElevation: 2,
    iconTheme: lightIconTheme,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Color(0xFFFFFFFF),
    selectedItemColor: Color(0xFF444444),
    unselectedItemColor: Color(0xFF444444),
    showSelectedLabels: true,
    showUnselectedLabels: true,
  ),
  iconTheme: lightIconTheme,
  cardTheme: const CardTheme(
    margin: EdgeInsets.zero,
    clipBehavior: Clip.antiAlias,
    color: Colors.white,
  ),
);

IconThemeData lightIconTheme = const IconThemeData(color: Color(0xFF444444));

final mapLightThemeConfig = jsonEncode([
  {
    "elementType": "geometry",
    "stylers": [
      {"color": "#f5f5f5"}
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {"color": "#adadad"},
      {"visibility": "on"}
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#616161"}
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {"color": "#f5f5f5"}
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {"color": "#eeeeee"}
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {"color": "#e5e5e5"}
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {"color": "#ffffff"}
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#757575"}
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {"color": "#dadada"}
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#616161"}
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#9e9e9e"}
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {"color": "#e5e5e5"}
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {"color": "#eeeeee"}
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {"color": "#c9c9c9"}
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {"color": "#9e9e9e"}
    ]
  }
]);
