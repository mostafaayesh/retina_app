import 'package:flutter/material.dart';
import 'package:retina/routing/json_nominatim.dart';

class Room {
  String name = "placeholder";
  double x;
  double y;
  double latitude;
  double longitude;
  String type = "general";
  String info = "No information available";

  Room({
    this.name,
    this.x,
    this.y,
    this.latitude,
    this.longitude,
    this.type,
    this.info,
  });

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'name':name,
      'x':x,
      'y':y,
      'latitude':latitude,
      'longitude':longitude,
      'type':type,
      'info':info,
    };
    return map;
  }

  Room.frommap(Map<String, dynamic> map){
    name = map['id'];
    x = map['x'];
    y = map['y'];
    latitude = map['latitude'];
    longitude = map['longitude'];
    type = map['type'];
    info = map['info'];
  }
}

class RoomModel extends ChangeNotifier {
  Room room;
  RoomModel({this.room});
}
