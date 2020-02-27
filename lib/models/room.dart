import 'package:flutter/material.dart';

class Room {
  String name = "placeholder";
  double x;
  double y;
  double latitude;
  double longitude;
  String info = "No information available";

  Room({
    this.name,
    this.x,
    this.y,
    this.latitude,
    this.longitude,
    this.info,
  });
}

class RoomModel extends ChangeNotifier {
  Room room;
  RoomModel({this.room});
}
