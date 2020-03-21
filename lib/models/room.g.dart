// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// SqfEntityGenerator
// **************************************************************************

//  These classes was generated by SqfEntity
//  Copyright (c) 2019, All rights reserved. Use of this source code is governed by a
//  Apache license that can be found in the LICENSE file.

//  To use these SqfEntity classes do following:
//  - import model.dart into where to use
//  - start typing ex:Room.select()... (add a few filters with fluent methods)...(add orderBy/orderBydesc if you want)...
//  - and then just put end of filters / or end of only select()  toSingle() / or toList()
//  - you can select one or return List<yourObject> by your filters and orders
//  - also you can batch update or batch delete by using delete/update methods instead of tosingle/tolist methods
//    Enjoy.. Huseyin Tokpunar

// BEGIN TABLES
// Room TABLE
class TableRoom extends SqfEntityTableBase {
  TableRoom() {
    // declare properties of EntityTable
    tableName = 'Room';
    relationType = null;
    primaryKeyName = 'name';
    primaryKeyType = PrimaryKeyType.text;
    useSoftDeleting = false;
    // when useSoftDeleting is true, creates a field named 'isDeleted' on the table, and set to '1' this field when item deleted (does not hard delete)

    // declare fields
    fields = [
      SqfEntityFieldBase('x', DbType.real),
      SqfEntityFieldBase('y', DbType.real),
      SqfEntityFieldBase('latitude', DbType.real),
      SqfEntityFieldBase('longitude', DbType.real),
      SqfEntityFieldBase('type', DbType.text),
      SqfEntityFieldBase('info', DbType.text),
    ];
    super.init();
  }
  static SqfEntityTableBase _instance;
  static SqfEntityTableBase get getInstance {
    return _instance = _instance ?? TableRoom();
  }
}
// END TABLES

// BEGIN DATABASE MODEL
class Itbdb extends SqfEntityModelProvider {
  Itbdb() {
    databaseName = itbdb.databaseName;
    databaseTables = [
      TableRoom.getInstance,
    ];

    bundledDatabasePath = itbdb
        .bundledDatabasePath; //'assets/sample.db'; // This value is optional. When bundledDatabasePath is empty then EntityBase creats a new database when initializing the database
  }
  Map<String, dynamic> getControllers() {
    final controllers = <String, dynamic>{};

    return controllers;
  }
}
// END DATABASE MODEL

// BEGIN ENTITIES
// region Room
class Room {
  Room(
      {this.name,
      this.x,
      this.y,
      this.latitude,
      this.longitude,
      this.type,
      this.info}) {
    _setDefaultValues();
  }
  Room.withFields(name, this.x, this.y, this.latitude, this.longitude,
      this.type, this.info) {
    _setDefaultValues();
  }
  Room.withId(name, this.x, this.y, this.latitude, this.longitude, this.type,
      this.info) {
    _setDefaultValues();
  }
  Room.fromMap(Map<String, dynamic> o) {
    _setDefaultValues();
    name = o['name'] as String;
    if (o['x'] != null) x = double.tryParse(o['x'].toString());
    if (o['y'] != null) y = double.tryParse(o['y'].toString());
    if (o['latitude'] != null)
      latitude = double.tryParse(o['latitude'].toString());
    if (o['longitude'] != null)
      longitude = double.tryParse(o['longitude'].toString());
    if (o['type'] != null) type = o['type'] as String;
    if (o['info'] != null) info = o['info'] as String;

    isSaved = true;
  }
  // FIELDS (Room)
  String name;
  double x;
  double y;
  double latitude;
  double longitude;
  String type;
  String info;
  bool isSaved;
  BoolResult saveResult;
  // end FIELDS (Room)

  static const bool _softDeleteActivated = false;
  RoomManager __mnRoom;

  RoomManager get _mnRoom {
    return __mnRoom = __mnRoom ?? RoomManager();
  }

  // METHODS
  Map<String, dynamic> toMap({bool forQuery = false, bool forJson = false}) {
    final map = <String, dynamic>{};
    if (name != null) {
      map['name'] = name;
    }
    if (x != null) {
      map['x'] = x;
    }

    if (y != null) {
      map['y'] = y;
    }

    if (latitude != null) {
      map['latitude'] = latitude;
    }

    if (longitude != null) {
      map['longitude'] = longitude;
    }

    if (type != null) {
      map['type'] = type;
    }

    if (info != null) {
      map['info'] = info;
    }

    return map;
  }

  Future<Map<String, dynamic>> toMapWithChilds(
      [bool forQuery = false, bool forJson = false]) async {
    final map = <String, dynamic>{};
    if (name != null) {
      map['name'] = name;
    }
    if (x != null) {
      map['x'] = x;
    }

    if (y != null) {
      map['y'] = y;
    }

    if (latitude != null) {
      map['latitude'] = latitude;
    }

    if (longitude != null) {
      map['longitude'] = longitude;
    }

    if (type != null) {
      map['type'] = type;
    }

    if (info != null) {
      map['info'] = info;
    }

    return map;
  }

  /// This method always returns Json String
  String toJson() {
    return json.encode(toMap(forJson: true));
  }

  /// This method always returns Json String
  Future<String> toJsonWithChilds() async {
    return json.encode(await toMapWithChilds(false, true));
  }

  List<dynamic> toArgs() {
    return [name, x, y, latitude, longitude, type, info];
  }

  List<dynamic> toArgsWithIds() {
    return [name, x, y, latitude, longitude, type, info];
  }

  static Future<List<Room>> fromWebUrl(String url) async {
    try {
      final response = await http.get(url);
      return await fromJson(response.body);
    } catch (e) {
      print('SQFENTITY ERROR Room.fromWebUrl: ErrorMessage: ${e.toString()}');
      return null;
    }
  }

  static Future<List<Room>> fromJson(String jsonBody) async {
    final Iterable list = await json.decode(jsonBody) as Iterable;
    var objList = <Room>[];
    try {
      objList = list
          .map((room) => Room.fromMap(room as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('SQFENTITY ERROR Room.fromJson: ErrorMessage: ${e.toString()}');
    }
    return objList;
  }

  /*
    /// REMOVED AFTER v1.2.1+14 
    static Future<List<Room>> fromObjectList(Future<List<dynamic>> o) async {
      final data = await o;
      return await Room.fromMapList(data);
    } 
    */

  static Future<List<Room>> fromMapList(List<dynamic> data,
      {bool preload = false,
      List<String> preloadFields,
      bool loadParents = false}) async {
    final List<Room> objList = <Room>[];
    for (final map in data) {
      final obj = Room.fromMap(map as Map<String, dynamic>);

      objList.add(obj);
    }
    return objList;
  }

  /// returns Room by ID if exist, otherwise returns null
  ///
  /// Primary Keys: String name
  ///
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  ///
  /// ex: getById(preload:true) -> Loads all related objects
  ///
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  ///
  /// ex: getById(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  ///
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  ///
  /// <returns>returns Room if exist, otherwise returns null
  Future<Room> getById(String name,
      {bool preload = false,
      List<String> preloadFields,
      bool loadParents = false}) async {
    if (name == null) {
      return null;
    }
    Room obj;
    final data = await _mnRoom.getById([name]);
    if (data.length != 0) {
      obj = Room.fromMap(data[0] as Map<String, dynamic>);
    } else {
      obj = null;
    }
    return obj;
  }

  /// Saves the (Room) object. If the Primary Key (name) field is null, returns Error.
  ///
  /// INSERTS (If not exist) OR REPLACES (If exist) data while Primary Key is not null.
  ///
  /// Call the saveAs() method if you do not want to save it when there is another row with the same name

  /// <returns>Returns BoolResult
  Future<BoolResult> save() async {
    final result = BoolResult(success: false);
    try {
      await _mnRoom.rawInsert(
          'INSERT ${isSaved ? 'OR REPLACE' : ''} INTO Room (name,x, y, latitude, longitude, type, info)  VALUES (?,?,?,?,?,?,?)',
          toArgs());
      result.success = true;
      isSaved = true;
    } catch (e) {
      result.errorMessage = e.toString();
    }

    saveResult = result;
    return result;
  }

  /// saveAll method saves the sent List<Room> as a bulk in one transaction
  ///
  /// Returns a <List<BoolResult>>
  Future<List<dynamic>> saveAll(List<Room> rooms) async {
    // final results = _mnRoom.saveAll('INSERT OR REPLACE INTO Room (name,x, y, latitude, longitude, type, info)  VALUES (?,?,?,?,?,?,?)',rooms);
    // return results; removed in sqfentity_gen 1.3.0+6
    Itbdb().batchStart();
    for (final obj in rooms) {
      await obj.save();
    }
    return Itbdb().batchCommit();
  }

  /// Updates if the record exists, otherwise adds a new row

  /// <returns>Returns name
  Future<int> upsert() async {
    try {
      if (await _mnRoom.rawInsert(
              'INSERT OR REPLACE INTO Room (name,x, y, latitude, longitude, type, info)  VALUES (?,?,?,?,?,?,?)',
              [name, x, y, latitude, longitude, type, info]) ==
          1) {
        saveResult = BoolResult(
            success: true,
            successMessage: 'Room name=$name updated successfuly');
      } else {
        saveResult = BoolResult(
            success: false, errorMessage: 'Room name=$name did not update');
      }
      return 1;
    } catch (e) {
      saveResult = BoolResult(
          success: false,
          errorMessage: 'Room Save failed. Error: ${e.toString()}');
      return 0;
    }
  }

  /// Deletes Room

  /// <returns>BoolResult res.success=Deleted, not res.success=Can not deleted
  Future<BoolResult> delete([bool hardDelete = false]) async {
    print('SQFENTITIY: delete Room invoked (name=$name)');
    if (!_softDeleteActivated || hardDelete) {
      return _mnRoom
          .delete(QueryParams(whereString: 'name=?', whereArguments: [name]));
    } else {
      return _mnRoom.updateBatch(
          QueryParams(whereString: 'name=?', whereArguments: [name]),
          {'isDeleted': 1});
    }
  }

  //private RoomFilterBuilder _Select;
  RoomFilterBuilder select({List<String> columnsToSelect, bool getIsDeleted}) {
    return RoomFilterBuilder(this)
      .._getIsDeleted = getIsDeleted == true
      ..qparams.selectColumns = columnsToSelect;
  }

  RoomFilterBuilder distinct(
      {List<String> columnsToSelect, bool getIsDeleted}) {
    return RoomFilterBuilder(this)
      .._getIsDeleted = getIsDeleted == true
      ..qparams.selectColumns = columnsToSelect
      ..qparams.distinct = true;
  }

  void _setDefaultValues() {
    isSaved = false;
  }
  // END METHODS
  // CUSTOM CODES
  /*
      you must define customCode property of your SqfEntityTable constant for ex:
      const tablePerson = SqfEntityTable(
      tableName: 'person',
      primaryKeyName: 'id',
      primaryKeyType: PrimaryKeyType.integer_auto_incremental,
      fields: [
        SqfEntityField('firstName', DbType.text),
        SqfEntityField('lastName', DbType.text),
      ],
      customCode: '''
       String fullName()
       { 
         return '$firstName $lastName';
       }
      ''');
     */
  // END CUSTOM CODES
}
// endregion room

// region RoomField
class RoomField extends SearchCriteria {
  RoomField(this.roomFB) {
    param = DbParameter();
  }
  DbParameter param;
  String _waitingNot = '';
  RoomFilterBuilder roomFB;

  RoomField get not {
    _waitingNot = ' NOT ';
    return this;
  }

  RoomFilterBuilder equals(dynamic pValue) {
    param.expression = '=';
    roomFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, roomFB.parameters, param, SqlSyntax.EQuals,
            roomFB._addedBlocks)
        : setCriteria(pValue, roomFB.parameters, param, SqlSyntax.NotEQuals,
            roomFB._addedBlocks);
    _waitingNot = '';
    roomFB._addedBlocks.needEndBlock[roomFB._blockIndex] =
        roomFB._addedBlocks.retVal;
    return roomFB;
  }

  RoomFilterBuilder equalsOrNull(dynamic pValue) {
    param.expression = '=';
    roomFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, roomFB.parameters, param, SqlSyntax.EQualsOrNull,
            roomFB._addedBlocks)
        : setCriteria(pValue, roomFB.parameters, param,
            SqlSyntax.NotEQualsOrNull, roomFB._addedBlocks);
    _waitingNot = '';
    roomFB._addedBlocks.needEndBlock[roomFB._blockIndex] =
        roomFB._addedBlocks.retVal;
    return roomFB;
  }

  RoomFilterBuilder isNull() {
    roomFB._addedBlocks = setCriteria(
        0,
        roomFB.parameters,
        param,
        SqlSyntax.IsNULL.replaceAll(SqlSyntax.notKeyword, _waitingNot),
        roomFB._addedBlocks);
    _waitingNot = '';
    roomFB._addedBlocks.needEndBlock[roomFB._blockIndex] =
        roomFB._addedBlocks.retVal;
    return roomFB;
  }

  RoomFilterBuilder contains(dynamic pValue) {
    if (pValue != null) {
      roomFB._addedBlocks = setCriteria(
          '%${pValue.toString()}%',
          roomFB.parameters,
          param,
          SqlSyntax.Contains.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          roomFB._addedBlocks);
      _waitingNot = '';
      roomFB._addedBlocks.needEndBlock[roomFB._blockIndex] =
          roomFB._addedBlocks.retVal;
    }
    return roomFB;
  }

  RoomFilterBuilder startsWith(dynamic pValue) {
    if (pValue != null) {
      roomFB._addedBlocks = setCriteria(
          '${pValue.toString()}%',
          roomFB.parameters,
          param,
          SqlSyntax.Contains.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          roomFB._addedBlocks);
      _waitingNot = '';
      roomFB._addedBlocks.needEndBlock[roomFB._blockIndex] =
          roomFB._addedBlocks.retVal;
      roomFB._addedBlocks.needEndBlock[roomFB._blockIndex] =
          roomFB._addedBlocks.retVal;
    }
    return roomFB;
  }

  RoomFilterBuilder endsWith(dynamic pValue) {
    if (pValue != null) {
      roomFB._addedBlocks = setCriteria(
          '%${pValue.toString()}',
          roomFB.parameters,
          param,
          SqlSyntax.Contains.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          roomFB._addedBlocks);
      _waitingNot = '';
      roomFB._addedBlocks.needEndBlock[roomFB._blockIndex] =
          roomFB._addedBlocks.retVal;
    }
    return roomFB;
  }

  RoomFilterBuilder between(dynamic pFirst, dynamic pLast) {
    if (pFirst != null && pLast != null) {
      roomFB._addedBlocks = setCriteria(
          pFirst,
          roomFB.parameters,
          param,
          SqlSyntax.Between.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          roomFB._addedBlocks,
          pLast);
    } else if (pFirst != null) {
      if (_waitingNot != '') {
        roomFB._addedBlocks = setCriteria(pFirst, roomFB.parameters, param,
            SqlSyntax.LessThan, roomFB._addedBlocks);
      } else {
        roomFB._addedBlocks = setCriteria(pFirst, roomFB.parameters, param,
            SqlSyntax.GreaterThanOrEquals, roomFB._addedBlocks);
      }
    } else if (pLast != null) {
      if (_waitingNot != '') {
        roomFB._addedBlocks = setCriteria(pLast, roomFB.parameters, param,
            SqlSyntax.GreaterThan, roomFB._addedBlocks);
      } else {
        roomFB._addedBlocks = setCriteria(pLast, roomFB.parameters, param,
            SqlSyntax.LessThanOrEquals, roomFB._addedBlocks);
      }
    }
    _waitingNot = '';
    roomFB._addedBlocks.needEndBlock[roomFB._blockIndex] =
        roomFB._addedBlocks.retVal;
    return roomFB;
  }

  RoomFilterBuilder greaterThan(dynamic pValue) {
    param.expression = '>';
    roomFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, roomFB.parameters, param, SqlSyntax.GreaterThan,
            roomFB._addedBlocks)
        : setCriteria(pValue, roomFB.parameters, param,
            SqlSyntax.LessThanOrEquals, roomFB._addedBlocks);
    _waitingNot = '';
    roomFB._addedBlocks.needEndBlock[roomFB._blockIndex] =
        roomFB._addedBlocks.retVal;
    return roomFB;
  }

  RoomFilterBuilder lessThan(dynamic pValue) {
    param.expression = '<';
    roomFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, roomFB.parameters, param, SqlSyntax.LessThan,
            roomFB._addedBlocks)
        : setCriteria(pValue, roomFB.parameters, param,
            SqlSyntax.GreaterThanOrEquals, roomFB._addedBlocks);
    _waitingNot = '';
    roomFB._addedBlocks.needEndBlock[roomFB._blockIndex] =
        roomFB._addedBlocks.retVal;
    return roomFB;
  }

  RoomFilterBuilder greaterThanOrEquals(dynamic pValue) {
    param.expression = '>=';
    roomFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, roomFB.parameters, param,
            SqlSyntax.GreaterThanOrEquals, roomFB._addedBlocks)
        : setCriteria(pValue, roomFB.parameters, param, SqlSyntax.LessThan,
            roomFB._addedBlocks);
    _waitingNot = '';
    roomFB._addedBlocks.needEndBlock[roomFB._blockIndex] =
        roomFB._addedBlocks.retVal;
    return roomFB;
  }

  RoomFilterBuilder lessThanOrEquals(dynamic pValue) {
    param.expression = '<=';
    roomFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, roomFB.parameters, param,
            SqlSyntax.LessThanOrEquals, roomFB._addedBlocks)
        : setCriteria(pValue, roomFB.parameters, param, SqlSyntax.GreaterThan,
            roomFB._addedBlocks);
    _waitingNot = '';
    roomFB._addedBlocks.needEndBlock[roomFB._blockIndex] =
        roomFB._addedBlocks.retVal;
    return roomFB;
  }

  RoomFilterBuilder inValues(dynamic pValue) {
    roomFB._addedBlocks = setCriteria(
        pValue,
        roomFB.parameters,
        param,
        SqlSyntax.IN.replaceAll(SqlSyntax.notKeyword, _waitingNot),
        roomFB._addedBlocks);
    _waitingNot = '';
    roomFB._addedBlocks.needEndBlock[roomFB._blockIndex] =
        roomFB._addedBlocks.retVal;
    return roomFB;
  }
}
// endregion RoomField

// region RoomFilterBuilder
class RoomFilterBuilder extends SearchCriteria {
  RoomFilterBuilder(Room obj) {
    whereString = '';
    qparams = QueryParams();
    parameters = <DbParameter>[];
    orderByList = <String>[];
    groupByList = <String>[];
    _addedBlocks = AddedBlocks(<bool>[], <bool>[]);
    _addedBlocks.needEndBlock.add(false);
    _addedBlocks.waitingStartBlock.add(false);
    _pagesize = 0;
    _page = 0;
    _obj = obj;
  }
  AddedBlocks _addedBlocks;
  int _blockIndex = 0;
  List<DbParameter> parameters;
  List<String> orderByList;
  Room _obj;
  QueryParams qparams;
  int _pagesize;
  int _page;

  /// put the sql keyword 'AND'
  RoomFilterBuilder get and {
    if (parameters.isNotEmpty) {
      parameters[parameters.length - 1].wOperator = ' AND ';
    }
    return this;
  }

  /// put the sql keyword 'OR'
  RoomFilterBuilder get or {
    if (parameters.isNotEmpty) {
      parameters[parameters.length - 1].wOperator = ' OR ';
    }
    return this;
  }

  /// open parentheses
  RoomFilterBuilder get startBlock {
    _addedBlocks.waitingStartBlock.add(true);
    _addedBlocks.needEndBlock.add(false);
    _blockIndex++;
    if (_blockIndex > 1) _addedBlocks.needEndBlock[_blockIndex - 1] = true;
    return this;
  }

  /// String whereCriteria, write raw query without 'where' keyword. Like this: 'field1 like 'test%' and field2 = 3'
  RoomFilterBuilder where(String whereCriteria, {dynamic parameterValue}) {
    if (whereCriteria != null && whereCriteria != '') {
      final DbParameter param = DbParameter();
      _addedBlocks = setCriteria(parameterValue ?? 0, parameters, param,
          '($whereCriteria)', _addedBlocks);
      _addedBlocks.needEndBlock[_blockIndex] = _addedBlocks.retVal;
    }
    return this;
  }

  /// page = page number,
  ///
  /// pagesize = row(s) per page
  RoomFilterBuilder page(int page, int pagesize) {
    if (page > 0) _page = page;
    if (pagesize > 0) _pagesize = pagesize;
    return this;
  }

  /// int count = LIMIT
  RoomFilterBuilder top(int count) {
    if (count > 0) {
      _pagesize = count;
    }
    return this;
  }

  /// close parentheses
  RoomFilterBuilder get endBlock {
    if (_addedBlocks.needEndBlock[_blockIndex]) {
      parameters[parameters.length - 1].whereString += ' ) ';
    }
    _addedBlocks.needEndBlock.removeAt(_blockIndex);
    _addedBlocks.waitingStartBlock.removeAt(_blockIndex);
    _blockIndex--;
    return this;
  }

  /// argFields might be String or List<String>.
  ///
  /// Example 1: argFields='name, date'
  ///
  /// Example 2: argFields = ['name', 'date']
  RoomFilterBuilder orderBy(dynamic argFields) {
    if (argFields != null) {
      if (argFields is String) {
        orderByList.add(argFields);
      } else {
        for (String s in argFields) {
          if (s != null && s != '') orderByList.add(' $s ');
        }
      }
    }
    return this;
  }

  /// argFields might be String or List<String>.
  ///
  /// Example 1: argFields='field1, field2'
  ///
  /// Example 2: argFields = ['field1', 'field2']
  RoomFilterBuilder orderByDesc(dynamic argFields) {
    if (argFields != null) {
      if (argFields is String) {
        orderByList.add('$argFields desc ');
      } else {
        for (String s in argFields) {
          if (s != null && s != '') orderByList.add(' $s desc ');
        }
      }
    }
    return this;
  }

  /// argFields might be String or List<String>.
  ///
  /// Example 1: argFields='field1, field2'
  ///
  /// Example 2: argFields = ['field1', 'field2']
  RoomFilterBuilder groupBy(dynamic argFields) {
    if (argFields != null) {
      if (argFields is String) {
        groupByList.add(' $argFields ');
      } else {
        for (String s in argFields) {
          if (s != null && s != '') groupByList.add(' $s ');
        }
      }
    }
    return this;
  }

  RoomField setField(RoomField field, String colName, DbType dbtype) {
    return RoomField(this)
      ..param = DbParameter(
          dbType: dbtype,
          columnName: colName,
          wStartBlock: _addedBlocks.waitingStartBlock[_blockIndex]);
  }

  RoomField _name;
  RoomField get name {
    return _name = setField(_name, 'name', DbType.integer);
  }

  RoomField _x;
  RoomField get x {
    return _x = setField(_x, 'x', DbType.real);
  }

  RoomField _y;
  RoomField get y {
    return _y = setField(_y, 'y', DbType.real);
  }

  RoomField _latitude;
  RoomField get latitude {
    return _latitude = setField(_latitude, 'latitude', DbType.real);
  }

  RoomField _longitude;
  RoomField get longitude {
    return _longitude = setField(_longitude, 'longitude', DbType.real);
  }

  RoomField _type;
  RoomField get type {
    return _type = setField(_type, 'type', DbType.text);
  }

  RoomField _info;
  RoomField get info {
    return _info = setField(_info, 'info', DbType.text);
  }

  bool _getIsDeleted;

  void _buildParameters() {
    if (_page > 0 && _pagesize > 0) {
      qparams
        ..limit = _pagesize
        ..offset = (_page - 1) * _pagesize;
    } else {
      qparams
        ..limit = _pagesize
        ..offset = _page;
    }
    for (DbParameter param in parameters) {
      if (param.columnName != null) {
        if (param.value is List) {
          param.value = param.value
              .toString()
              .replaceAll('[', '')
              .replaceAll(']', '')
              .toString();
          whereString += param.whereString
              .replaceAll('{field}', param.columnName)
              .replaceAll('?', param.value.toString());
          param.value = null;
        } else {
          whereString +=
              param.whereString.replaceAll('{field}', param.columnName);
        }
        if (!param.whereString.contains('?')) {
        } else {
          switch (param.dbType) {
            case DbType.bool:
              param.value =
                  param.value == null ? null : param.value == true ? 1 : 0;
              param.value2 =
                  param.value2 == null ? null : param.value2 == true ? 1 : 0;
              break;
            case DbType.date:
            case DbType.datetime:
            case DbType.datetimeUtc:
              param.value = param.value == null
                  ? null
                  : (param.value as DateTime).millisecondsSinceEpoch;
              param.value2 = param.value2 == null
                  ? null
                  : (param.value2 as DateTime).millisecondsSinceEpoch;
              break;
            default:
          }
          if (param.value != null) {
            whereArguments.add(param.value);
          }
          if (param.value2 != null) {
            whereArguments.add(param.value2);
          }
        }
      } else {
        whereString += param.whereString;
      }
    }
    if (Room._softDeleteActivated) {
      if (whereString != '') {
        whereString =
            '${!_getIsDeleted ? 'ifnull(isDeleted,0)=0 AND' : ''} ($whereString)';
      } else if (!_getIsDeleted) {
        whereString = 'ifnull(isDeleted,0)=0';
      }
    }

    if (whereString != '') {
      qparams.whereString = whereString;
    }
    qparams
      ..whereArguments = whereArguments
      ..groupBy = groupByList.join(',')
      ..orderBy = orderByList.join(',');
  }

  /// Deletes List<Room> bulk by query
  ///
  /// <returns>BoolResult res.success=Deleted, not res.success=Can not deleted
  Future<BoolResult> delete([bool hardDelete = false]) async {
    _buildParameters();
    var r = BoolResult();
    if (Room._softDeleteActivated && !hardDelete) {
      r = await _obj._mnRoom.updateBatch(qparams, {'isDeleted': 1});
    } else {
      r = await _obj._mnRoom.delete(qparams);
    }
    return r;
  }

  /// using:
  ///
  /// update({'fieldName': Value})
  ///
  /// fieldName must be String. Value is dynamic, it can be any of the (int, bool, String.. )
  Future<BoolResult> update(Map<String, dynamic> values) {
    _buildParameters();
    if (qparams.limit > 0 || qparams.offset > 0) {
      qparams.whereString =
          'name IN (SELECT name from Room ${qparams.whereString.isNotEmpty ? 'WHERE ${qparams.whereString}' : ''}${qparams.limit > 0 ? ' LIMIT ${qparams.limit}' : ''}${qparams.offset > 0 ? ' OFFSET ${qparams.offset}' : ''})';
    }
    return _obj._mnRoom.updateBatch(qparams, values);
  }

  /// This method always returns Room Obj if exist, otherwise returns null
  ///
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  ///
  /// ex: toSingle(preload:true) -> Loads all related objects
  ///
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  ///
  /// ex: toSingle(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  ///
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  ///
  /// <returns>List<Room>
  Future<Room> toSingle(
      {bool preload = false,
      List<String> preloadFields,
      bool loadParents = false}) async {
    _pagesize = 1;
    _buildParameters();
    final objFuture = _obj._mnRoom.toList(qparams);
    final data = await objFuture;
    Room obj;
    if (data.isNotEmpty) {
      obj = Room.fromMap(data[0] as Map<String, dynamic>);
    } else {
      obj = null;
    }
    return obj;
  }

  /// This method always returns int.
  ///
  /// <returns>int
  Future<int> toCount([VoidCallback Function(int c) roomCount]) async {
    _buildParameters();
    qparams.selectColumns = ['COUNT(1) AS CNT'];
    final roomsFuture = await _obj._mnRoom.toList(qparams);
    final int count = roomsFuture[0]['CNT'] as int;
    if (roomCount != null) {
      roomCount(count);
    }
    return count;
  }

  /// This method always returns List<Room>.
  ///
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  ///
  /// ex: toList(preload:true) -> Loads all related objects
  ///
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  ///
  /// ex: toList(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  ///
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  ///
  /// <returns>List<Room>
  Future<List<Room>> toList(
      {bool preload = false,
      List<String> preloadFields,
      bool loadParents = false}) async {
    final data = await toMapList();
    final List<Room> roomsData = await Room.fromMapList(data,
        preload: preload,
        preloadFields: preloadFields,
        loadParents: loadParents);
    return roomsData;
  }

  /// This method always returns Json String
  Future<String> toJson() async {
    final list = <dynamic>[];
    final data = await toList();
    for (var o in data) {
      list.add(o.toMap(forJson: true));
    }
    return json.encode(list);
  }

  /// This method always returns Json String.
  Future<String> toJsonWithChilds() async {
    final list = <dynamic>[];
    final data = await toList();
    for (var o in data) {
      list.add(await o.toMapWithChilds(false, true));
    }
    return json.encode(list);
  }

  /// This method always returns List<dynamic>.
  ///
  /// <returns>List<dynamic>
  Future<List<dynamic>> toMapList() async {
    _buildParameters();
    return await _obj._mnRoom.toList(qparams);
  }

  /// Returns List<DropdownMenuItem<Room>>
  Future<List<DropdownMenuItem<Room>>> toDropDownMenu(String displayTextColumn,
      [VoidCallback Function(List<DropdownMenuItem<Room>> o)
          dropDownMenu]) async {
    _buildParameters();
    final roomsFuture = _obj._mnRoom.toList(qparams);

    final data = await roomsFuture;
    final int count = data.length;
    final List<DropdownMenuItem<Room>> items = []..add(DropdownMenuItem(
        value: Room(),
        child: Text('Select Room'),
      ));
    for (int i = 0; i < count; i++) {
      items.add(
        DropdownMenuItem(
          value: Room.fromMap(data[i] as Map<String, dynamic>),
          child: Text(data[i][displayTextColumn].toString()),
        ),
      );
    }
    if (dropDownMenu != null) {
      dropDownMenu(items);
    }
    return items;
  }

  /// Returns List<DropdownMenuItem<int>>
  Future<List<DropdownMenuItem<int>>> toDropDownMenuInt(
      String displayTextColumn,
      [VoidCallback Function(List<DropdownMenuItem<int>> o)
          dropDownMenu]) async {
    _buildParameters();
    qparams.selectColumns = ['name', displayTextColumn];
    final roomsFuture = _obj._mnRoom.toList(qparams);

    final data = await roomsFuture;
    final int count = data.length;
    final List<DropdownMenuItem<int>> items = []..add(DropdownMenuItem(
        value: 0,
        child: Text('Select Room'),
      ));
    for (int i = 0; i < count; i++) {
      items.add(
        DropdownMenuItem(
          value: data[i]['name'] as int,
          child: Text(data[i][displayTextColumn].toString()),
        ),
      );
    }
    if (dropDownMenu != null) {
      dropDownMenu(items);
    }
    return items;
  }

  /// This method always returns Primary Key List<String>.
  /// <returns>List<int>
  Future<List<String>> toListPrimaryKey([bool buildParameters = true]) async {
    if (buildParameters) _buildParameters();
    final List<String> nameData = <String>[];
    qparams.selectColumns = ['name'];
    final nameFuture = await _obj._mnRoom.toList(qparams);

    final int count = nameFuture.length;
    for (int i = 0; i < count; i++) {
      nameData.add(nameFuture[i]['name'] as String);
    }
    return nameData;
  }

  /// Returns List<dynamic> for selected columns. Use this method for 'groupBy' with min,max,avg..
  ///
  /// Sample usage: (see EXAMPLE 4.2 at https://github.com/hhtokpinar/sqfEntity#group-by)
  Future<List<dynamic>> toListObject(
      [VoidCallback Function(List<dynamic> o) listObject]) async {
    _buildParameters();

    final objectFuture = _obj._mnRoom.toList(qparams);

    final List<dynamic> objectsData = <dynamic>[];
    final data = await objectFuture;
    final int count = data.length;
    for (int i = 0; i < count; i++) {
      objectsData.add(data[i]);
    }
    if (listObject != null) {
      listObject(objectsData);
    }
    return objectsData;
  }

  /// Returns List<String> for selected first column
  ///
  /// Sample usage: await Room.select(columnsToSelect: ['columnName']).toListString()
  Future<List<String>> toListString(
      [VoidCallback Function(List<String> o) listString]) async {
    _buildParameters();

    final objectFuture = _obj._mnRoom.toList(qparams);

    final List<String> objectsData = <String>[];
    final data = await objectFuture;
    final int count = data.length;
    for (int i = 0; i < count; i++) {
      objectsData.add(data[i][qparams.selectColumns[0]].toString());
    }
    if (listString != null) {
      listString(objectsData);
    }
    return objectsData;
  }
}
// endregion RoomFilterBuilder

// region RoomFields
class RoomFields {
  static TableField _fName;
  static TableField get name {
    return _fName =
        _fName ?? SqlSyntax.setField(_fName, 'name', DbType.integer);
  }

  static TableField _fX;
  static TableField get x {
    return _fX = _fX ?? SqlSyntax.setField(_fX, 'x', DbType.real);
  }

  static TableField _fY;
  static TableField get y {
    return _fY = _fY ?? SqlSyntax.setField(_fY, 'y', DbType.real);
  }

  static TableField _fLatitude;
  static TableField get latitude {
    return _fLatitude =
        _fLatitude ?? SqlSyntax.setField(_fLatitude, 'latitude', DbType.real);
  }

  static TableField _fLongitude;
  static TableField get longitude {
    return _fLongitude = _fLongitude ??
        SqlSyntax.setField(_fLongitude, 'longitude', DbType.real);
  }

  static TableField _fType;
  static TableField get type {
    return _fType = _fType ?? SqlSyntax.setField(_fType, 'type', DbType.text);
  }

  static TableField _fInfo;
  static TableField get info {
    return _fInfo = _fInfo ?? SqlSyntax.setField(_fInfo, 'info', DbType.text);
  }
}
// endregion RoomFields

//region RoomManager
class RoomManager extends SqfEntityProvider {
  RoomManager()
      : super(Itbdb(),
            tableName: _tableName, // colId: _colId,
            primaryKeyList: _primaryKeyList,
            whereStr: _whereStr);
  static String _tableName = 'Room';
  //static String _colId = 'name';
  static List<String> _primaryKeyList = ['name'];
  static String _whereStr = 'name=?';
}

//endregion RoomManager
class ItbdbSequenceManager extends SqfEntityProvider {
  ItbdbSequenceManager() : super(Itbdb());
}
// END OF ENTITIES
