import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:retina/models/room.dart';
import 'package:retina/widgets/card_tile.dart';
import 'package:retina/widgets/room_widgets.dart';

class NearbyScreen extends StatefulWidget {
  @override
  _NearbyScreenState createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {
  final Room room_101 = Room(
    name: "101",
    x: 2.3,
    y: 1.4,
    info: "Requires Keycard Access",
  );
  final Room room_102 = Room(
    name: "102",
    x: 5.3,
    y: 2.4,
    info: "Requires Physical Key",
  );
  final Room room_103 = Room(
    name: "103",
    x: 3.3,
    y: 6.4,
  );

  @override
  Widget build(BuildContext context) {
    var roomModel = Provider.of<RoomModel>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              semanticLabel: "Go back to the main screen", size: 35.0),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Nearby Rooms",
          semanticsLabel: "Nearby rooms screen",
        ),
        centerTitle: true,
      ),
      // TODO: Use ListViewBuilder
      body: ListView(
        padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
        children: <Widget>[
          RoomTile(
            room: room_101,
            onTap: () {
              roomModel.room = room_101;
              Get.toNamed("/roominfo");
            },
          ),
          RoomTile(
            room: room_102,
            onTap: () {
              roomModel.room = room_102;
              Get.toNamed("/roominfo");
            },
          ),
          RoomTile(
            room: room_103,
            onTap: () {
              roomModel.room = room_103;
              Get.toNamed("/roominfo");
            },
          ),
        ],
      ),
    );
  }
}
