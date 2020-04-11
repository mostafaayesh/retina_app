import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:retina/models/room.dart';
import 'package:retina/utils/attitude.dart';
import 'package:retina/utils/nominatim.dart';
import 'package:retina/utils/valhalla.dart';
import 'package:retina/widgets/card_tile.dart';
import 'package:retina/widgets/instruction.dart';
<<<<<<< Updated upstream
=======
import 'package:flutter_tts/flutter_tts.dart';


import '../widgets/instruction.dart';
>>>>>>> Stashed changes

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

<<<<<<< Updated upstream
class _NavigationScreenState extends State<NavigationScreen> {
  final inst1 = Instruction(direction: Direction.FORWARD, distance: 2.0);
  final inst2 = Instruction(direction: Direction.RIGHT, distance: 5.5);
  final inst3 = Instruction(direction: Direction.LEFT, distance: 0.5);
  final inst4 = Instruction(direction: Direction.FORWARD, distance: 5.0);
=======
// Check if the user is within 3.0 meters of the anchor and determine whether it should inform the user of the next instruction
int getUpdate(double xPos, double yPos, double xAnchor, double yAnchor, int instNum){
  if( getDistance(xPos, xAnchor, yPos, yAnchor) < 3.0 )
  {
    instNum ++;
  }
  return instNum;
}

List<Instruction> instList = new List<Instruction>();
FlutterTts flutterTts = FlutterTts();

//Future<List<Instruction>> getInstruction() async{
//  String host = "130.113.70.130:8102";
//  final testn = await getNominatimOutput(
//    host,
//    "Information Technology Building A109 Doorway",
//  );
//  GlobalCoordinates testCoords= getGlobalCoordinate(testn);
//  GlobalCoordinates startpoint = new GlobalCoordinates(latitude:43.2584731, longitude:-79.9211783);
//  GlobalCoordinates endpoint = getGlobalCoordinate(testn);
//  Trip trip = await fetchRouteFromNetwork(host, startpoint, endpoint);
//
//
//  return Future.delayed(Duration(seconds: 0), () => instList);
//}


class _NavigationScreenState extends State<NavigationScreen> {
  Future getInstruction() async {
    String host = "130.113.70.130:8102";
    final testn = await getNominatimOutput(
      host,
      "Information Technology Building A109 Doorway",
    );
    GlobalCoordinates testCoords= getGlobalCoordinate(testn);
    GlobalCoordinates startpoint = new GlobalCoordinates(latitude:43.2584731, longitude:-79.9211783);
    GlobalCoordinates endpoint = getGlobalCoordinate(testn);
    Trip trip = await fetchRouteFromNetwork(host, startpoint, endpoint);
    debugPrint( 'start point => $startpoint' );
    debugPrint( 'end point => $endpoint' );
    instList = getInstructions(trip);
    return Future.delayed(Duration(seconds: 0), () => instList);
  }
>>>>>>> Stashed changes
  @override
  Widget build(BuildContext context) {
    final room_model = Provider.of<RoomModel>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.cancel,
              semanticLabel:
                  "Stop navigating and go back to the previous screen",
              size: 35.0,
            ),
            onPressed: () => Get.back()),
        title: Text(
          "Navigating to ${room_model.room.name}",
          semanticsLabel: "Navigating to Room ${room_model.room.name}",
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              semanticLabel: "Stop navigating and go back to the main screen",
              size: 35.0,
            ),
            onPressed: () => Get.close(3),
          )
        ],
      ),
<<<<<<< Updated upstream
      body: Center(
        child: ListView(
          padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
          children: <Widget>[
            CurrentInstruction(
              instruction: inst1,
            ),
            InstructionTile(
              instruction: inst2,
            ),
            InstructionTile(
              instruction: inst3,
            ),
            InstructionTile(
              instruction: inst4,
            ),
            CardTile(titleText: "Room ${room_model.room.name} should be on your Right",)
          ],
        ),
      ),
=======
      body: FutureBuilder(
        future: getInstruction(),
        initialData: [1],
        builder: ( BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.none &&
              snapshot.hasData == null) {
            return ListView();
          }
          return ListView.builder(
            padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListView(
                children: <Widget>[
                  if( instList.isNotEmpty )
                    CurrentInstruction(
                      instruction: instList[0],
                    ),
                  for( int i=1; i < instList.length; i++ )
                    (
                        InstructionTile(
                          instruction: instList[i],
                        )
                    ),
                  CardTile(titleText: "Room ${room_model.room.name} should be on your Right",),

                  new ListTile(
                    leading: new Icon(Icons.plus_one, color: Colors.black),
//                    onTap: () => positionUpdate( context, room_model ),
                  )
                ],
//                  if( instList.isNotEmpty )
//                    CurrentInstruction( instruction: instList[0], ),
//                for( int i = 1; i < instList.length; i++ )
//                  (
//                      InstructionTile(
//                        instruction: instList[i],
//                      )
//                  ),
//                CardTile(titleText: "Room ${room_model.room
//                    .name} should be on your Right",),
//
//                new ListTile(
//                  leading: new Icon(Icons.plus_one, color: Colors.black),
//                  onTap: () => positionUpdate(context, room_model),
//                  );
              );

              },
            );
          },
      )
>>>>>>> Stashed changes
    );
//        child: ListView(
//          padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
//
//          children: <Widget>[
//            if( instList.isNotEmpty )
//              CurrentInstruction(
//                  instruction: instList[0],
//              ),
//            for( int i=1; i < instList.length; i++ )
//            (
//                InstructionTile(
//                  instruction: instList[i],
//                )
//            ),
//            CardTile(titleText: "Room ${room_model.room.name} should be on your Right",),
//
//            new ListTile(
//              leading: new Icon(Icons.plus_one, color: Colors.black),
//              onTap: () => positionUpdate( context, room_model ),
//            )
//          ],
//        ),
        }
  }
<<<<<<< Updated upstream
}
=======

//  positionUpdate(BuildContext context, final room_model) async {
//    if( instNum < getUpdate(100, 20, 98, 23, instNum) )
//    if( instList.length > 1)
//    {
//      flutterTts.speak( instList[1].text );
//      instList = instList.sublist(1);
//      final result = await Navigator.push((context),
//        MaterialPageRoute(builder: (context) => build(context) ) , );
//      setState(() {
//
//      });
//    }
//  }
//}

>>>>>>> Stashed changes
