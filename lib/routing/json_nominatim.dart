// To parse this JSON data, do
//
//     final nominatimOutput = nominatimOutputFromJson(jso
import 'dart:convert';
import 'dart:async' show Future;
import 'package:http/http.dart' as http;

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

  factory NominatimOutput.fromJson(Map<String, dynamic> json) => NominatimOutput(
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

Future<List<double>> getEndPointbyRoom(String ip, int roomnum) async{
  var url = "http://"+ip+"/search?q=Information%20Technology%20Building%20"
      + roomnum.toString()+"%20Doorway&format=json&limit=5";
  List<double> ll= [];
  var response = await http.get(url);
  if(response.statusCode == 200){
    //print (response.body);
    var jsonResponse = json.decode(response.body);
    //print(jsonResponse[0]["lat"]);
    NominatimOutput nout = NominatimOutput.fromJson(jsonResponse[0]);
    ll.add(double.parse(nout.lon));
    ll.add(double.parse(nout.lat));
    return ll;
  }else {
    throw Exception('Failed to load json!');
  }
}
