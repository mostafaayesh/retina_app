import 'dart:async';
import 'package:path/path.dart';
import 'package:retina/routing/json_nominatim.dart';
import 'package:sqflite/sqflite.dart';
import 'room.dart';

class RoomDBHelper {
  RoomDBHelper._();
  static final RoomDBHelper db = RoomDBHelper._();
  static Database _database;

  Future<Database> get database async{
    if(_database != null)
      return _database;

    _database = await initDB();
    return _database;
  }
  initDB() async{
    return await openDatabase(join(await getDatabasesPath(),"rooms.db"),
    version:1,
    onOpen: (db){},
    onCreate: (Database db, int version) async{
      await db.execute("CREATE TABLE Room ("
          "name TEXT,"
          "x REAL,"
          "y REAL,"
          "latitude REAL,"
          "longtitude REAL,"
          "type TEXT,"
          "info TEXT"
          ")");
    });
  }

  addRoom(Room newRoom) async{
    final db = await database;
    var res = await db.insert("Room", newRoom.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

  getRoom(String roomnum) async{
    final db = await database;
    var res = await db.query("Room", where:"name = ?", whereArgs: [roomnum]);
    return res.isNotEmpty ? Room.frommap(res.first):Null;
  }

  Future<List<Room>> getAllRoom() async{
    final db = await database;
    var res = await db.query("Room");
    List<Room> list = res.isNotEmpty ? res.map((c)=> Room.frommap(c)).toList():[];
    return list;
  }

  updateRoom(Room newRoom) async{
    final db = await database;
    var res = await db.update("Room", newRoom.toMap(),
        where:"name = ?", whereArgs: [newRoom.name]);
  }
  deleteRoom(String room) async{
    final db = await database;
    db.delete("Room", where: "room = ?", whereArgs: [room]);
  }

  deleteAll() async{
    final db = await database;
    db.rawDelete("Delete * from Room");
  }

}

void fillDB() async{
  String ip = "130.113.70.130:7070";
  List<String> officeRooms = ['101','102','181','103','104','105',
    '106','107','108','109','110','111','112','113','114',
    '115','116','120','121','122','123','124','125','126',
    '127','128','129','130','131','132','133','134','135',
    '136','138','145','146','147','148','149','150','151',
    '152','159','160','161','162','163','164','165','166',
    '167','168','169','170','171','172','A106','A107','A108',
    'A109','A110','A111','A112','184'];
  List<String>  washRooms = ['117','118','119','A104','A105'];
  List<String>  lectureRooms = ['137','139','140','141','142','143',
    '153','154','155','156','157','158','A102','A103','A113',
    'A114'];
  Room newRoom;
  List<double> ll = await getEndPointbyRoom(ip, int.parse("101"));
  newRoom = Room(name:"101",x:1,y:1,latitude:ll[1],longitude:ll[0], type:"office");
  await RoomDBHelper.db.addRoom(newRoom);
  //for(String officeRoom in officeRooms){
  //  List<double> ll = await getEndPointbyRoom(ip, int.parse(officeRoom));
  //  newRoom = Room(name:officeRoom,x:1,y:1,latitude:ll[1],longitude:ll[0], type:"office");
  //  await RoomDBHelper.db.addRoom(newRoom);
//  }
}

void getallroom() async{
  List<Room> room= await RoomDBHelper.db.getAllRoom();
  print(room);
}