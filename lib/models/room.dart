import 'package:flutter/material.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'room.g.dart';

const tableRoom = SqfEntityTable(
    tableName: 'Room',
    primaryKeyName: 'name',
    primaryKeyType: PrimaryKeyType.text,
    relationType: null,
    useSoftDeleting: false,
    // when useSoftDeleting is true, creates a field named 'isDeleted' on the table, and set to '1' this field when item deleted (does not hard delete)
    fields: [
      SqfEntityField('x', DbType.real),
      SqfEntityField('y', DbType.real),
      SqfEntityField('latitude', DbType.real),
      SqfEntityField('longitude', DbType.real),
      SqfEntityField('type', DbType.text),
      SqfEntityField('info', DbType.text),
    ]);
// END TABLES

// BEGIN DATABASE MODEL
@SqfEntityBuilder(itbdb)
const itbdb = SqfEntityModel(
  modelName: 'Itbdb',
  databaseName: 'itb.db',
  databaseTables: [
    tableRoom,
  ],
  bundledDatabasePath: 'assets/itb.db',
); // END itb.db MODEL

class RoomNotifier extends ChangeNotifier {
  Room room;
  RoomNotifier({this.room});
}
