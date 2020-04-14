import 'dart:convert';
import 'dart:async' show Future;
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:retina/utils/attitude.dart';
import 'package:retina/widgets/instruction.dart';
class ValhallaOutput {
  Trip trip;

  ValhallaOutput({
    this.trip,
  });

  factory ValhallaOutput.fromJson(Map<String, dynamic> json) => ValhallaOutput(
        trip: Trip.fromJson(json["trip"]),
      );
}

class Trip {
  String language;
  int status;
  String units;
  String statusMessage;
  List<Leg> legs;
  Summary summary;
  List<Location> locations;

  Trip({
    this.language,
    this.status,
    this.units,
    this.statusMessage,
    this.legs,
    this.summary,
    this.locations,
  });

  factory Trip.fromJson(Map<String, dynamic> json) => Trip(
        language: json["language"],
        status: json["status"],
        units: json["units"],
        statusMessage: json["status_message"],
        legs: List<Leg>.from(json["legs"].map((x) => Leg.fromJson(x))),
        summary: Summary.fromJson(json["summary"]),
        locations: List<Location>.from(
            json["locations"].map((x) => Location.fromJson(x))),
      );
}

class Leg {
  String shape;
  Summary summary;
  List<Maneuver> maneuvers;

  Leg({
    this.shape,
    this.summary,
    this.maneuvers,
  });

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
        shape: json["shape"],
        summary: Summary.fromJson(json["summary"]),
        maneuvers: List<Maneuver>.from(
            json["maneuvers"].map((x) => Maneuver.fromJson(x))),
      );
}

class Maneuver {
  String travelType;
  String travelMode;
  bool rough;
  int beginShapeIndex;
  double length;
  int endShapeIndex;
  String instruction;
  String verbalPreTransitionInstruction;
  int type;
  int time;
  String verbalTransitionAlertInstruction;
  String verbalPostTransitionInstruction;
  bool verbalMultiCue;

  Maneuver({
    this.travelType,
    this.travelMode,
    this.rough,
    this.beginShapeIndex,
    this.length,
    this.endShapeIndex,
    this.instruction,
    this.verbalPreTransitionInstruction,
    this.type,
    this.time,
    this.verbalTransitionAlertInstruction,
    this.verbalPostTransitionInstruction,
    this.verbalMultiCue,
  });

  factory Maneuver.fromJson(Map<String, dynamic> json) => Maneuver(
        travelType: json["travel_type"],
        travelMode: json["travel_mode"],
        rough: json["rough"] == null ? null : json["rough"],
        beginShapeIndex: json["begin_shape_index"],
        length: json["length"].toDouble(),
        endShapeIndex: json["end_shape_index"],
        instruction: json["instruction"],
        verbalPreTransitionInstruction:
            json["verbal_pre_transition_instruction"],
        type: json["type"],
        time: json["time"],
        verbalTransitionAlertInstruction:
            json["verbal_transition_alert_instruction"] == null
                ? null
                : json["verbal_transition_alert_instruction"],
        verbalPostTransitionInstruction:
            json["verbal_post_transition_instruction"] == null
                ? null
                : json["verbal_post_transition_instruction"],
        verbalMultiCue:
            json["verbal_multi_cue"] == null ? null : json["verbal_multi_cue"],
      );
}

class Summary {
  double maxLon;
  double maxLat;
  int time;
  double length;
  double minLat;
  double minLon;

  Summary({
    this.maxLon,
    this.maxLat,
    this.time,
    this.length,
    this.minLat,
    this.minLon,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        maxLon: json["max_lon"].toDouble(),
        maxLat: json["max_lat"].toDouble(),
        time: json["time"],
        length: json["length"].toDouble(),
        minLat: json["min_lat"].toDouble(),
        minLon: json["min_lon"].toDouble(),
      );
}

class Location {
  int originalIndex;
  double lon;
  double lat;
  String type;

  Location({
    this.originalIndex,
    this.lon,
    this.lat,
    this.type,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        originalIndex: json["original_index"],
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
        type: json["type"],
      );
}

class valInstruction{
  String instruction;
  double length;
  String preverbalInstruction;
  String postverbalInstruction;
  String alertInstruction;

  valInstruction({this.instruction,
    this.length,
    this.preverbalInstruction,
    this.postverbalInstruction,
    this.alertInstruction});
}

List<List<double>> polylineDecode(String encodedShape) {
  int index = 0;
  int lat = 0;
  int long = 0;

  List<List<double>> coordlist = [];
  List<double> coord = [];
  int byte;
  int shift = 0;
  int res = 0;
  while (index < encodedShape.length) {
    byte = 0x20;
    shift = 0;
    res = 0;

    do {
      byte = encodedShape.codeUnitAt(index++) - 63;
      res |= (byte & 0x1f) << shift;
      shift += 5;
    } while (byte >= 0x20);

    int lat_change = ((res & 1) != 0 ? ~(res >> 1) : (res >> 1));
    lat += lat_change;
    shift = 0;
    res = 0;

    do {
      byte = encodedShape.codeUnitAt(index++) - 63;
      res |= (byte & 0x1f) << shift;
      shift += 5;
    } while (byte >= 0x20);

    int long_change = ((res & 1) != 0 ? ~(res >> 1) : (res >> 1));
    long += long_change;

    coord = [(long / 1E6).toDouble(), (lat / 1E6).toDouble()];
    coordlist.add(coord);
  }
  return coordlist;
}

Future<List<Maneuver>> loadJsonAsset(String assetloc) async {
  var jsonTxt = await rootBundle.loadString(assetloc);
  Map<String, dynamic> jsonResponse = json.decode(jsonTxt);
  ValhallaOutput valData = ValhallaOutput.fromJson(jsonResponse);
  Trip trip = valData.trip;
  List<Leg> legs = trip.legs;
  return legs[0].maneuvers;
}

Future<Trip> fetchRouteFromNetwork(String host, GlobalCoordinates startpoint,
    GlobalCoordinates endpoint) async {
  Response response = await Dio(BaseOptions(responseType: ResponseType.plain))
      .post("http://$host/route", data: {
    "verbose": true,
    "locations": [
      {"lat": startpoint.latitude, "lon": startpoint.longitude},
      {"lat": endpoint.latitude, "lon": endpoint.longitude}
    ],
    "costing": "pedestrian",
    "directions_options": {"units": "kilometers"}
  });
  if (response.statusCode != 200) {
    throw Exception(
        'HTTP Error: ${response.statusCode} ${response.statusMessage}');
  }
  ValhallaOutput valData = ValhallaOutput.fromJson(json.decode(response.data));
  return valData.trip;
  //List<Leg> legs = trip.legs;
  //return legs[0].shape;
}

String getShape(Trip trip){
    return trip.legs[0].shape;
}

List<valInstruction> getValInstructions(Trip trip){
  List<valInstruction> newInstruction= List<valInstruction>();
  trip.legs[0].maneuvers.forEach((x)=>newInstruction.add(
      valInstruction(instruction:x.instruction,
          length:x.length,
          preverbalInstruction:x.verbalPreTransitionInstruction,
          postverbalInstruction:x.verbalPostTransitionInstruction,
          alertInstruction:x.verbalTransitionAlertInstruction)));


  return newInstruction;
}
Direction getDirectionFromValhalla(String valIns){
  if(valIns.contains('Turn')){
    if(valIns.contains('right'))return Direction.RIGHT;
    else if(valIns.contains('left')) return Direction.LEFT;
  }
  return Direction.FORWARD;

}
List<Instruction> getInstructions(Trip trip){
  List<Instruction> newInstruction= List<Instruction>();
  trip.legs[0].maneuvers.forEach((x)=>newInstruction.add(
      Instruction(direction:getDirectionFromValhalla(x.instruction),
          distance:x.length*100,
  )));
  return newInstruction;


}