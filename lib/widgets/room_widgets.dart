import 'package:flutter/material.dart';
import 'package:retina/models/room.dart';
import 'package:retina/utils/attitude.dart';
import 'package:retina/widgets/card_tile.dart';

class RoomVector extends StatelessWidget {
  RoomVector({this.distance, this.direction});
  final distance;
  final direction;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.arrow_forward),
        Text(
          "${this.distance.toStringAsFixed(1)} m",
          semanticsLabel: "${this.distance.toStringAsFixed(1)} meters to the ${direction.toString().split(".").last}",
        ),
      ],
    );
  }
}

class RoomTile extends StatelessWidget {
  RoomTile({this.room, this.onTap});

  final Room room;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return CardTile(
      titleText: this.room.name,
      semanticsLabel: "Room ${this.room.name}",
      trailing: RoomVector(
        direction: getDirection(
            0, 0, this.room.x, this.room.y, CardinalDirection.NORTH),
        distance: getDistance(0, 0, this.room.x, this.room.y),
      ),
      onTap: this.onTap,
    );
  }
}
