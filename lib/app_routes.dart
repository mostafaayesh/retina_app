import 'package:flutter/material.dart';
import 'package:retina/screens/home.dart';
import 'package:retina/screens/navigation.dart';
import 'package:retina/screens/nearby.dart';
import 'package:retina/screens/room_info.dart';
import 'package:retina/screens/search.dart';

final app_routes = {
  "/home": (BuildContext context) => new HomeScreen(),
  "/nearby": (BuildContext context) => new NearbyScreen(),
  "/roominfo": (BuildContext context) => new RoomScreen(),
  "/navigation": (BuildContext context) => new NavigationScreen(),
  "/search": (BuildContext context) => new SearchScreen(),
};
