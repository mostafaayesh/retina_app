import 'dart:convert';
import 'dart:async' show Future;
import 'package:dio/dio.dart';
import 'package:retina/utils/attitude.dart';

class NominatimOutput {
  int placeId;
  String licence;
  String osmType;
  int osmId;
  List<String> boundingbox;
  String lat;
  String lon;
  String displayName;
  String nominatimOutputClass;
  String type;
  double importance;

  NominatimOutput({
    this.placeId,
    this.licence,
    this.osmType,
    this.osmId,
    this.boundingbox,
    this.lat,
    this.lon,
    this.displayName,
    this.nominatimOutputClass,
    this.type,
    this.importance,
  });

  factory NominatimOutput.fromJson(Map<String, dynamic> json) =>
      NominatimOutput(
        placeId: json["place_id"],
        licence: json["licence"],
        osmType: json["osm_type"],
        osmId: json["osm_id"],
        boundingbox: List<String>.from(json["boundingbox"].map((x) => x)),
        lat: json["lat"],
        lon: json["lon"],
        displayName: json["display_name"],
        nominatimOutputClass: json["class"],
        type: json["type"],
        importance: json["importance"].toDouble(),
      );
}

Future<GlobalCoordinate> getGlobalCoordinates(String host, String query) async {
  Response response = await Dio(BaseOptions(
    responseType: ResponseType.plain,
  )).get(
    "http://$host/search",
    queryParameters: {
      "q": query,
      "format": "json",
      "limit": 1
    },
  );
  if (response.statusCode != 200) {
    throw Exception(
        'HTTP error: ${response.statusCode} ${response.statusMessage}');
  }
  NominatimOutput nominatimOutput =
      NominatimOutput.fromJson(json.decode(response.data.toString())[0]);
  return GlobalCoordinates(
    latitude: double.parse(nominatimOutput.lat),
    longitude: double.parse(nominatimOutput.lon),
  );
}
