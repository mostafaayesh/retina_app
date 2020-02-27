import 'package:flutter/material.dart';
import 'package:retina/utils/attitude.dart';
import 'package:retina/widgets/card_tile.dart';

class Instruction {
  String text;
  final Direction direction;
  final double distance;

  Instruction({this.direction, this.distance}) {
    if (this.direction == Direction.FORWARD ||
        this.direction == Direction.BACKWARD) {
      this.text =
          "Walk ${this.direction.toString().split(".").last.toLowerCase()} for ${this.distance} meters";
    } else {
      this.text =
          "Turn ${this.direction.toString().split(".").last.toLowerCase()} after ${this.distance} meters";
    }
  }
}

class CurrentInstruction extends StatelessWidget {
  final Instruction instruction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Card(
        shape: CircleBorder(),
        child: ListTile(
          contentPadding: EdgeInsets.all(20.0),
          title: Column(
            children: <Widget>[
              Icon(
                getIcon(this.instruction.direction),
                size: 100.0,
                semanticLabel: "${this.instruction.text}",
              ),
              Text(
                "${this.instruction.distance} m",
                semanticsLabel: " ",
              ),
            ],
          ),
        ),
      ),
    );
  }

  CurrentInstruction({this.instruction});
}

IconData getIcon(direction) {
  switch (direction) {
    case Direction.FORWARD:
      {
        return Icons.arrow_upward;
      }
      break;
    case Direction.BACKWARD:
      {
        return Icons.arrow_downward;
      }
      break;
    case Direction.RIGHT:
      {
        return Icons.arrow_right;
      }
      break;
    case Direction.LEFT:
      {
        return Icons.arrow_left;
      }
      break;
  }
}

class DirectionColumn extends StatelessWidget {
  final Instruction instruction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(getIcon(this.instruction.direction)),
        Text("${this.instruction.distance} m")
      ],
    );
  }

  DirectionColumn({this.instruction});
}

class InstructionTile extends StatelessWidget {
  final Instruction instruction;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return CardTile(
      titleText: this.instruction.text,
      trailing: DirectionColumn(instruction: this.instruction),
      onTap: this.onTap,
    );
  }

  InstructionTile({this.instruction, this.onTap});
}
