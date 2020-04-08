import 'package:retina/utils/valhalla.dart';
import 'package:retina/utils/attitude.dart';
import 'package:retina/widgets/instruction.dart';

void main() async{
  String host = "130.113.70.130:8102";
  GlobalCoordinates startpoint = new GlobalCoordinates(latitude:43.258896, longitude:-79.920441);
  GlobalCoordinates endpoint = new GlobalCoordinates(latitude:43.258473, longitude:-79.921178);
  Trip trip = await fetchRouteFromNetwork(host, startpoint, endpoint);
  List<Instruction> instruction = getInstructions(trip);
  instruction.forEach((ins)=>print(ins.text));
}