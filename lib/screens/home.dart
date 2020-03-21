import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retina/widgets/card_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "RETINA",
          semanticsLabel: "Retina main screen",
        ),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
        children: <Widget>[
          CardTile(
            leading: Icon(Icons.search),
            titleText: "Search Rooms",
            semanticsLabel: "Search all rooms",
            onTap: () => Get.toNamed("/search"),
          ),
          CardTile(
            leading: Icon(Icons.near_me),
            titleText: "Nearby Rooms",
            semanticsLabel: "List nearby rooms",
            onTap: () => Get.toNamed("/nearby"),
          ),
          CardTile(
            leading: Icon(Icons.favorite),
            titleText: "Favorite Rooms",
            semanticsLabel: "List favorite rooms",
          ),
        ],
      ),
    );
  }
}
