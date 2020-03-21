import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:retina/models/room.dart';
import 'package:retina/widgets/card_tile.dart';
import 'package:retina/widgets/room_widgets.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

var _query = "";
TextEditingController editingController = TextEditingController();

class _SearchScreenState extends State<SearchScreen> {
  Future searchRooms(String query) async {
    return await Room().select().name.contains(query).toList();
  }

  @override
  Widget build(BuildContext context) {
    var roomNotifier = Provider.of<RoomNotifier>(context);
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
            child: TextField(
              autofocus: true,
              controller: editingController,
              onChanged: (val) => setState(() {
                _query = val;
              }),
              decoration: InputDecoration(
                labelText: "Search rooms",
                prefixIcon: Icon(Icons.search),
              ),
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: searchRooms(_query),
              initialData: [],
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.none &&
                    snapshot.hasData == null) {
                  return ListView();
                }
                return ListView.builder(
                  padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RoomTile(
                      room: snapshot.data[index],
                      onTap: () {
                        roomNotifier.room = snapshot.data[index];
                        Get.toNamed("/roominfo");
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
