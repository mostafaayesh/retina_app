import 'package:retina/utils/valhalla.dart';
import 'package:retina/utils/attitude.dart';

void main() async{
  String host = "130.113.70.130:8102";
  GlobalCoordinates startpoint = new GlobalCoordinates(43.258896, -79.920441);
  GlobalCoordinates endpoint = new GlobalCoordinates(43.258473, -79.921178);
  Trip trip = await fetchRouteFromNetwork(host, startpoint, endpoint);
  List<Instruction> instruction = getInstructions(trip);
  instruction.forEach((ins)=>print(ins.preverbalInstruction));
}