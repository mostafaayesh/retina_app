import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:retina/models/room.dart';
import 'package:retina/utils/attitude.dart';
import 'package:retina/widgets/card_tile.dart';
import 'package:retina/widgets/instruction.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final inst1 = Instruction(direction: Direction.FORWARD, distance: 2.0);
  final inst2 = Instruction(direction: Direction.RIGHT, distance: 5.5);
  final inst3 = Instruction(direction: Direction.LEFT, distance: 0.5);
  final inst4 = Instruction(direction: Direction.FORWARD, distance: 5.0);
  @override
  Widget build(BuildContext context) {
    final roomNotifier = Provider.of<RoomNotifier>(context);
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
          "Navigating to ${roomNotifier.room.name}",
          semanticsLabel: "Navigating to Room ${roomNotifier.room.name}",
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
            CardTile(titleText: "Room ${roomNotifier.room.name} should be on your Right",)
          ],
        ),
      ),
    );
  }
}
