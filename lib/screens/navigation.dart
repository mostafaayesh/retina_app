import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:retina/models/room.dart';
import 'package:retina/utils/attitude.dart';
import 'package:retina/widgets/card_tile.dart';
import 'package:retina/widgets/instruction.dart';
import 'package:flutter_tts/flutter_tts.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

// Check if the user is within 3.0 meters of the anchor and determine whether it should inform the user of the next instruction
int getUpdate(double xPos, double yPos, double xAnchor, double yAnchor, int instNum){
  if( getDistance(xPos, xAnchor, yPos, yAnchor) < 3.0 )
  {
    instNum ++;
  }
  return instNum;
}

List<Instruction> getInstruction(int roomNumber){
  // Should add function in Valhalla to get the route/number of Instruction given the room number
  int numberOfInstruction = 1;
  List<Instruction> instructions = new List<Instruction>();
  for(int i = 0; i < numberOfInstruction; i++)
  {
    //Another function to get the instruction one by one
    final inst1 = Instruction(direction: Direction.FORWARD, distance: 2.0);
    final inst2 = Instruction(direction: Direction.RIGHT, distance: 5.5);
    final inst3 = Instruction(direction: Direction.LEFT, distance: 0.5);
    final inst4 = Instruction(direction: Direction.FORWARD, distance: 5.0);
    final inst5 = Instruction(direction: Direction.LEFT, distance: 20.0);
    instructions.add(inst1);
    instructions.add(inst2);
    instructions.add(inst3);
    instructions.add(inst4);
    instructions.add(inst5);
  }
  return instructions;
}

class _NavigationScreenState extends State<NavigationScreen> {
  List<Instruction> instList = getInstruction(110);
  int instNum = 0;
  FlutterTts flutterTts = FlutterTts();
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
      body: Center(
        child: ListView(
          padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
          children: <Widget>[
            CurrentInstruction(
              instruction: instList[0],
            ),
            InstructionTile(
              instruction: instList[1],
            ),
            InstructionTile(
              instruction: instList[2],
            ),
            InstructionTile(
              instruction: instList[3],
            ),
            InstructionTile(
              instruction: instList[4],
            ),
            CardTile(titleText: "Room ${room_model.room.name} should be on your Right",),

            new ListTile(
              leading: new Icon(Icons.plus_one, color: Colors.black),
              onTap: () => positionUpdate( context, room_model ),
            )
          ],
        ),
      ),
    );
  }

  positionUpdate(BuildContext context, final room_model) async {
    debugPrint( "On Press" );
//    if( instNum < getUpdate(100, 20, 98, 23, instNum) )
        {
      instNum++;
      debugPrint('$instNum');
      flutterTts.speak( instList[instNum].text );
    }
    final result = await Navigator.push((context),
      MaterialPageRoute(builder: (context) => build(context) ) , );
    setState(() {

    });
  }
}

