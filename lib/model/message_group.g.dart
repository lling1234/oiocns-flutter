// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_group.dart';

// **************************************************************************
// SqfEntityGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names

//  These classes was generated by SqfEntity
//  Copyright (c) 2019, All rights reserved. Use of this source code is governed by a
//  Apache license that can be found in the LICENSE file.

//  To use these SqfEntity classes do following:
//  - import model.dart into where to use
//  - start typing ex:MessageGroup.select()... (add a few filters with fluent methods)...(add orderBy/orderBydesc if you want)...
//  - and then just put end of filters / or end of only select()  toSingle() / or toList()
//  - you can select one or return List<yourObject> by your filters and orders
//  - also you can batch update or batch delete by using delete/update methods instead of tosingle/tolist methods
//    Enjoy.. Huseyin Tokpunar

// BEGIN TABLES
// MessageGroup TABLE
class TableMessageGroup extends SqfEntityTableBase {
  TableMessageGroup() {
    // declare properties of EntityTable
    tableName = 'messageGroup';
    primaryKeyName = 'seqId';
    primaryKeyType = PrimaryKeyType.integer_auto_incremental;
    useSoftDeleting = false;
    // when useSoftDeleting is true, creates a field named 'isDeleted' on the table, and set to '1' this field when item deleted (does not hard delete)

    // declare fields
    fields = [
      SqfEntityFieldBase('account', DbType.text),
      SqfEntityFieldBase('id', DbType.integer),
      SqfEntityFieldBase('name', DbType.text),
    ];
    super.init();
  }
  static SqfEntityTableBase? _instance;
  static SqfEntityTableBase get getInstance {
    return _instance = _instance ?? TableMessageGroup();
  }
}
// END TABLES

// BEGIN SEQUENCES
// identity SEQUENCE
class SequenceIdentitySequence extends SqfEntitySequenceBase {
  SequenceIdentitySequence() {
    sequenceName = 'identity';
    maxValue =
        9007199254740991; /* optional. default is max int (9.223.372.036.854.775.807) */
    cycle = false; /* optional. default is false; */
    minValue = 0; /* optional. default is 0 */
    incrementBy = 1; /* optional. default is 1 */
    startWith = 0; /* optional. default is 0 */
    super.init();
  }
  static SequenceIdentitySequence? _instance;
  static SequenceIdentitySequence get getInstance {
    return _instance = _instance ?? SequenceIdentitySequence();
  }
}
// END SEQUENCES

// BEGIN DATABASE MODEL
class MessageGroupModel extends SqfEntityModelProvider {
  MessageGroupModel() {
    databaseName = messageGroupModel.databaseName;
    password = messageGroupModel.password;
    dbVersion = messageGroupModel.dbVersion;
    preSaveAction = messageGroupModel.preSaveAction;
    logFunction = messageGroupModel.logFunction;
    databaseTables = [
      TableMessageGroup.getInstance,
    ];

    sequences = [
      SequenceIdentitySequence.getInstance,
    ];

    bundledDatabasePath = messageGroupModel
        .bundledDatabasePath; //'assets/sample.db'; // This value is optional. When bundledDatabasePath is empty then EntityBase creats a new database when initializing the database
    databasePath = messageGroupModel.databasePath;
  }
  Map<String, dynamic> getControllers() {
    final controllers = <String, dynamic>{};

    return controllers;
  }
}
// END DATABASE MODEL

// BEGIN ENTITIES
// region MessageGroup
class MessageGroup extends TableBase {
  MessageGroup({this.seqId, this.account, this.id, this.name}) {
    _setDefaultValues();
    softDeleteActivated = false;
  }
  MessageGroup.withFields(this.account, this.id, this.name) {
    _setDefaultValues();
  }
  MessageGroup.withId(this.seqId, this.account, this.id, this.name) {
    _setDefaultValues();
  }
  // fromMap v2.0
  MessageGroup.fromMap(Map<String, dynamic> o, {bool setDefaultValues = true}) {
    if (setDefaultValues) {
      _setDefaultValues();
    }
    seqId = int.tryParse(o['seqId'].toString());
    if (o['account'] != null) {
      account = o['account'].toString();
    }
    if (o['id'] != null) {
      id = int.tryParse(o['id'].toString());
    }
    if (o['name'] != null) {
      name = o['name'].toString();
    }
  }
  // FIELDS (MessageGroup)
  int? seqId;
  String? account;
  int? id;
  String? name;

  // end FIELDS (MessageGroup)

  static const bool _softDeleteActivated = false;
  MessageGroupManager? __mnMessageGroup;

  MessageGroupManager get _mnMessageGroup {
    return __mnMessageGroup = __mnMessageGroup ?? MessageGroupManager();
  }

  // METHODS
  @override
  Map<String, dynamic> toMap(
      {bool forQuery = false, bool forJson = false, bool forView = false}) {
    final map = <String, dynamic>{};
    map['seqId'] = seqId;
    if (account != null || !forView) {
      map['account'] = account;
    }
    if (id != null || !forView) {
      map['id'] = id;
    }
    if (name != null || !forView) {
      map['name'] = name;
    }

    return map;
  }

  @override
  Future<Map<String, dynamic>> toMapWithChildren(
      [bool forQuery = false,
      bool forJson = false,
      bool forView = false]) async {
    final map = <String, dynamic>{};
    map['seqId'] = seqId;
    if (account != null || !forView) {
      map['account'] = account;
    }
    if (id != null || !forView) {
      map['id'] = id;
    }
    if (name != null || !forView) {
      map['name'] = name;
    }

    return map;
  }

  /// This method returns Json String [MessageGroup]
  @override
  String toJson() {
    return json.encode(toMap(forJson: true));
  }

  /// This method returns Json String [MessageGroup]
  @override
  Future<String> toJsonWithChilds() async {
    return json.encode(await toMapWithChildren(false, true));
  }

  @override
  List<dynamic> toArgs() {
    return [account, id, name];
  }

  @override
  List<dynamic> toArgsWithIds() {
    return [seqId, account, id, name];
  }

  static Future<List<MessageGroup>?> fromWebUrl(Uri uri,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.get(uri, headers: headers);
      return await fromJson(response.body);
    } catch (e) {
      debugPrint(
          'SQFENTITY ERROR MessageGroup.fromWebUrl: ErrorMessage: ${e.toString()}');
      return null;
    }
  }

  Future<http.Response> postUrl(Uri uri, {Map<String, String>? headers}) {
    return http.post(uri, headers: headers, body: toJson());
  }

  static Future<List<MessageGroup>> fromJson(String jsonBody) async {
    final Iterable list = await json.decode(jsonBody) as Iterable;
    var objList = <MessageGroup>[];
    try {
      objList = list
          .map((messagegroup) =>
              MessageGroup.fromMap(messagegroup as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint(
          'SQFENTITY ERROR MessageGroup.fromJson: ErrorMessage: ${e.toString()}');
    }
    return objList;
  }

  static Future<List<MessageGroup>> fromMapList(List<dynamic> data,
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields,
      bool setDefaultValues = true}) async {
    final List<MessageGroup> objList = <MessageGroup>[];
    loadedFields = loadedFields ?? [];
    for (final map in data) {
      final obj = MessageGroup.fromMap(map as Map<String, dynamic>,
          setDefaultValues: setDefaultValues);

      objList.add(obj);
    }
    return objList;
  }

  /// returns MessageGroup by ID if exist, otherwise returns null
  /// Primary Keys: int? seqId
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  /// ex: getById(preload:true) -> Loads all related objects
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  /// ex: getById(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  /// <returns>returns [MessageGroup] if exist, otherwise returns null
  Future<MessageGroup?> getById(int? seqId,
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields}) async {
    if (seqId == null) {
      return null;
    }
    MessageGroup? obj;
    final data = await _mnMessageGroup.getById([seqId]);
    if (data.length != 0) {
      obj = MessageGroup.fromMap(data[0] as Map<String, dynamic>);
    } else {
      obj = null;
    }
    return obj;
  }

  /// Saves the (MessageGroup) object. If the seqId field is null, saves as a new record and returns new seqId, if seqId is not null then updates record
  /// ignoreBatch = true as a default. Set ignoreBatch to false if you run more than one save() operation those are between batchStart and batchCommit
  /// <returns>Returns seqId
  @override
  Future<int?> save({bool ignoreBatch = true}) async {
    if (seqId == null || seqId == 0) {
      seqId = await _mnMessageGroup.insert(this, ignoreBatch);
    } else {
      await _mnMessageGroup.update(this);
    }

    return seqId;
  }

  /// Saves the (MessageGroup) object. If the seqId field is null, saves as a new record and returns new seqId, if seqId is not null then updates record
  /// ignoreBatch = true as a default. Set ignoreBatch to false if you run more than one save() operation those are between batchStart and batchCommit
  /// <returns>Returns seqId
  @override
  Future<int?> saveOrThrow({bool ignoreBatch = true}) async {
    if (seqId == null || seqId == 0) {
      seqId = await _mnMessageGroup.insertOrThrow(this, ignoreBatch);

      isInsert = true;
    } else {
      // seqId= await _upsert(); // removed in sqfentity_gen 1.3.0+6
      await _mnMessageGroup.updateOrThrow(this);
    }

    return seqId;
  }

  /// saveAs MessageGroup. Returns a new Primary Key value of MessageGroup

  /// <returns>Returns a new Primary Key value of MessageGroup
  @override
  Future<int?> saveAs({bool ignoreBatch = true}) async {
    seqId = null;

    return save(ignoreBatch: ignoreBatch);
  }

  /// saveAll method saves the sent List<MessageGroup> as a bulk in one transaction
  /// Returns a <List<BoolResult>>
  static Future<List<dynamic>> saveAll(List<MessageGroup> messagegroups,
      {bool? exclusive, bool? noResult, bool? continueOnError}) async {
    List<dynamic>? result = [];
    // If there is no open transaction, start one
    final isStartedBatch = await MessageGroupModel().batchStart();
    for (final obj in messagegroups) {
      await obj.save(ignoreBatch: false);
    }
    if (!isStartedBatch) {
      result = await MessageGroupModel().batchCommit(
          exclusive: exclusive,
          noResult: noResult,
          continueOnError: continueOnError);
      for (int i = 0; i < messagegroups.length; i++) {
        if (messagegroups[i].seqId == null) {
          messagegroups[i].seqId = result![i] as int;
        }
      }
    }
    return result!;
  }

  /// Updates if the record exists, otherwise adds a new row
  /// <returns>Returns seqId
  @override
  Future<int?> upsert({bool ignoreBatch = true}) async {
    try {
      final result = await _mnMessageGroup.rawInsert(
          'INSERT OR REPLACE INTO messageGroup (seqId, account, id, name)  VALUES (?,?,?,?)',
          [seqId, account, id, name],
          ignoreBatch);
      if (result! > 0) {
        saveResult = BoolResult(
            success: true,
            successMessage: 'MessageGroup seqId=$seqId updated successfully');
      } else {
        saveResult = BoolResult(
            success: false,
            errorMessage: 'MessageGroup seqId=$seqId did not update');
      }
      return seqId;
    } catch (e) {
      saveResult = BoolResult(
          success: false,
          errorMessage: 'MessageGroup Save failed. Error: ${e.toString()}');
      return null;
    }
  }

  /// inserts or replaces the sent List<<MessageGroup>> as a bulk in one transaction.
  /// upsertAll() method is faster then saveAll() method. upsertAll() should be used when you are sure that the primary key is greater than zero
  /// Returns a BoolCommitResult
  @override
  Future<BoolCommitResult> upsertAll(List<MessageGroup> messagegroups,
      {bool? exclusive, bool? noResult, bool? continueOnError}) async {
    final results = await _mnMessageGroup.rawInsertAll(
        'INSERT OR REPLACE INTO messageGroup (seqId, account, id, name)  VALUES (?,?,?,?)',
        messagegroups,
        exclusive: exclusive,
        noResult: noResult,
        continueOnError: continueOnError);
    return results;
  }

  /// Deletes MessageGroup

  /// <returns>BoolResult res.success= true (Deleted), false (Could not be deleted)
  @override
  Future<BoolResult> delete([bool hardDelete = false]) async {
    debugPrint('SQFENTITIY: delete MessageGroup invoked (seqId=$seqId)');
    if (!_softDeleteActivated || hardDelete) {
      return _mnMessageGroup
          .delete(QueryParams(whereString: 'seqId=?', whereArguments: [seqId]));
    } else {
      return _mnMessageGroup.updateBatch(
          QueryParams(whereString: 'seqId=?', whereArguments: [seqId]),
          {'isDeleted': 1});
    }
  }

  @override
  Future<BoolResult> recover([bool recoverChilds = true]) {
    // not implemented because:
    final msg =
        'set useSoftDeleting:true in the table definition of [MessageGroup] to use this feature';
    throw UnimplementedError(msg);
  }

  @override
  MessageGroupFilterBuilder select(
      {List<String>? columnsToSelect, bool? getIsDeleted}) {
    return MessageGroupFilterBuilder(this, getIsDeleted)
      ..qparams.selectColumns = columnsToSelect;
  }

  @override
  MessageGroupFilterBuilder distinct(
      {List<String>? columnsToSelect, bool? getIsDeleted}) {
    return MessageGroupFilterBuilder(this, getIsDeleted)
      ..qparams.selectColumns = columnsToSelect
      ..qparams.distinct = true;
  }

  void _setDefaultValues() {}

  @override
  void rollbackPk() {
    if (isInsert == true) {
      seqId = null;
    }
  }

  // END METHODS
  // BEGIN CUSTOM CODE
  /*
      you can define customCode property of your SqfEntityTable constant. For example:
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
  // END CUSTOM CODE
}
// endregion messagegroup

// region MessageGroupField
class MessageGroupField extends FilterBase {
  MessageGroupField(MessageGroupFilterBuilder messagegroupFB)
      : super(messagegroupFB);

  @override
  MessageGroupFilterBuilder equals(dynamic pValue) {
    return super.equals(pValue) as MessageGroupFilterBuilder;
  }

  @override
  MessageGroupFilterBuilder equalsOrNull(dynamic pValue) {
    return super.equalsOrNull(pValue) as MessageGroupFilterBuilder;
  }

  @override
  MessageGroupFilterBuilder isNull() {
    return super.isNull() as MessageGroupFilterBuilder;
  }

  @override
  MessageGroupFilterBuilder contains(dynamic pValue) {
    return super.contains(pValue) as MessageGroupFilterBuilder;
  }

  @override
  MessageGroupFilterBuilder startsWith(dynamic pValue) {
    return super.startsWith(pValue) as MessageGroupFilterBuilder;
  }

  @override
  MessageGroupFilterBuilder endsWith(dynamic pValue) {
    return super.endsWith(pValue) as MessageGroupFilterBuilder;
  }

  @override
  MessageGroupFilterBuilder between(dynamic pFirst, dynamic pLast) {
    return super.between(pFirst, pLast) as MessageGroupFilterBuilder;
  }

  @override
  MessageGroupFilterBuilder greaterThan(dynamic pValue) {
    return super.greaterThan(pValue) as MessageGroupFilterBuilder;
  }

  @override
  MessageGroupFilterBuilder lessThan(dynamic pValue) {
    return super.lessThan(pValue) as MessageGroupFilterBuilder;
  }

  @override
  MessageGroupFilterBuilder greaterThanOrEquals(dynamic pValue) {
    return super.greaterThanOrEquals(pValue) as MessageGroupFilterBuilder;
  }

  @override
  MessageGroupFilterBuilder lessThanOrEquals(dynamic pValue) {
    return super.lessThanOrEquals(pValue) as MessageGroupFilterBuilder;
  }

  @override
  MessageGroupFilterBuilder inValues(dynamic pValue) {
    return super.inValues(pValue) as MessageGroupFilterBuilder;
  }

  @override
  MessageGroupField get not {
    return super.not as MessageGroupField;
  }
}
// endregion MessageGroupField

// region MessageGroupFilterBuilder
class MessageGroupFilterBuilder extends ConjunctionBase {
  MessageGroupFilterBuilder(MessageGroup obj, bool? getIsDeleted)
      : super(obj, getIsDeleted) {
    _mnMessageGroup = obj._mnMessageGroup;
    _softDeleteActivated = obj.softDeleteActivated;
  }

  bool _softDeleteActivated = false;
  MessageGroupManager? _mnMessageGroup;

  /// put the sql keyword 'AND'
  @override
  MessageGroupFilterBuilder get and {
    super.and;
    return this;
  }

  /// put the sql keyword 'OR'
  @override
  MessageGroupFilterBuilder get or {
    super.or;
    return this;
  }

  /// open parentheses
  @override
  MessageGroupFilterBuilder get startBlock {
    super.startBlock;
    return this;
  }

  /// String whereCriteria, write raw query without 'where' keyword. Like this: 'field1 like 'test%' and field2 = 3'
  @override
  MessageGroupFilterBuilder where(String? whereCriteria,
      {dynamic parameterValue}) {
    super.where(whereCriteria, parameterValue: parameterValue);
    return this;
  }

  /// page = page number,
  /// pagesize = row(s) per page
  @override
  MessageGroupFilterBuilder page(int page, int pagesize) {
    super.page(page, pagesize);
    return this;
  }

  /// int count = LIMIT
  @override
  MessageGroupFilterBuilder top(int count) {
    super.top(count);
    return this;
  }

  /// close parentheses
  @override
  MessageGroupFilterBuilder get endBlock {
    super.endBlock;
    return this;
  }

  /// argFields might be String or List<String>.
  /// Example 1: argFields='name, date'
  /// Example 2: argFields = ['name', 'date']
  @override
  MessageGroupFilterBuilder orderBy(dynamic argFields) {
    super.orderBy(argFields);
    return this;
  }

  /// argFields might be String or List<String>.
  /// Example 1: argFields='field1, field2'
  /// Example 2: argFields = ['field1', 'field2']
  @override
  MessageGroupFilterBuilder orderByDesc(dynamic argFields) {
    super.orderByDesc(argFields);
    return this;
  }

  /// argFields might be String or List<String>.
  /// Example 1: argFields='field1, field2'
  /// Example 2: argFields = ['field1', 'field2']
  @override
  MessageGroupFilterBuilder groupBy(dynamic argFields) {
    super.groupBy(argFields);
    return this;
  }

  /// argFields might be String or List<String>.
  /// Example 1: argFields='name, date'
  /// Example 2: argFields = ['name', 'date']
  @override
  MessageGroupFilterBuilder having(dynamic argFields) {
    super.having(argFields);
    return this;
  }

  MessageGroupField _setField(
      MessageGroupField? field, String colName, DbType dbtype) {
    return MessageGroupField(this)
      ..param = DbParameter(
          dbType: dbtype, columnName: colName, wStartBlock: openedBlock);
  }

  MessageGroupField? _seqId;
  MessageGroupField get seqId {
    return _seqId = _setField(_seqId, 'seqId', DbType.integer);
  }

  MessageGroupField? _account;
  MessageGroupField get account {
    return _account = _setField(_account, 'account', DbType.text);
  }

  MessageGroupField? _id;
  MessageGroupField get id {
    return _id = _setField(_id, 'id', DbType.integer);
  }

  MessageGroupField? _name;
  MessageGroupField get name {
    return _name = _setField(_name, 'name', DbType.text);
  }

  /// Deletes List<MessageGroup> bulk by query
  ///
  /// <returns>BoolResult res.success= true (Deleted), false (Could not be deleted)
  @override
  Future<BoolResult> delete([bool hardDelete = false]) async {
    buildParameters();
    var r = BoolResult(success: false);

    if (_softDeleteActivated && !hardDelete) {
      r = await _mnMessageGroup!.updateBatch(qparams, {'isDeleted': 1});
    } else {
      r = await _mnMessageGroup!.delete(qparams);
    }
    return r;
  }

  /// using:
  /// update({'fieldName': Value})
  /// fieldName must be String. Value is dynamic, it can be any of the (int, bool, String.. )
  @override
  Future<BoolResult> update(Map<String, dynamic> values) {
    buildParameters();
    if (qparams.limit! > 0 || qparams.offset! > 0) {
      qparams.whereString =
          'seqId IN (SELECT seqId from messageGroup ${qparams.whereString!.isNotEmpty ? 'WHERE ${qparams.whereString}' : ''}${qparams.limit! > 0 ? ' LIMIT ${qparams.limit}' : ''}${qparams.offset! > 0 ? ' OFFSET ${qparams.offset}' : ''})';
    }
    return _mnMessageGroup!.updateBatch(qparams, values);
  }

  /// This method always returns [MessageGroup] Obj if exist, otherwise returns null
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  /// ex: toSingle(preload:true) -> Loads all related objects
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  /// ex: toSingle(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  /// <returns> MessageGroup?
  @override
  Future<MessageGroup?> toSingle(
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields}) async {
    buildParameters(pSize: 1);
    final objFuture = _mnMessageGroup!.toList(qparams);
    final data = await objFuture;
    MessageGroup? obj;
    if (data.isNotEmpty) {
      obj = MessageGroup.fromMap(data[0] as Map<String, dynamic>);
    } else {
      obj = null;
    }
    return obj;
  }

  /// This method always returns [MessageGroup]
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  /// ex: toSingle(preload:true) -> Loads all related objects
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  /// ex: toSingle(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  /// <returns> MessageGroup?
  @override
  Future<MessageGroup> toSingleOrDefault(
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields}) async {
    return await toSingle(
            preload: preload,
            preloadFields: preloadFields,
            loadParents: loadParents,
            loadedFields: loadedFields) ??
        MessageGroup();
  }

  /// This method returns int. [MessageGroup]
  /// <returns>int
  @override
  Future<int> toCount([VoidCallback Function(int c)? messagegroupCount]) async {
    buildParameters();
    qparams.selectColumns = ['COUNT(1) AS CNT'];
    final messagegroupsFuture = await _mnMessageGroup!.toList(qparams);
    final int count = messagegroupsFuture[0]['CNT'] as int;
    if (messagegroupCount != null) {
      messagegroupCount(count);
    }
    return count;
  }

  /// This method returns List<MessageGroup> [MessageGroup]
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  /// ex: toList(preload:true) -> Loads all related objects
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  /// ex: toList(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  /// <returns>List<MessageGroup>
  @override
  Future<List<MessageGroup>> toList(
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields}) async {
    final data = await toMapList();
    final List<MessageGroup> messagegroupsData = await MessageGroup.fromMapList(
        data,
        preload: preload,
        preloadFields: preloadFields,
        loadParents: loadParents,
        loadedFields: loadedFields,
        setDefaultValues: qparams.selectColumns == null);
    return messagegroupsData;
  }

  /// This method returns Json String [MessageGroup]
  @override
  Future<String> toJson() async {
    final list = <dynamic>[];
    final data = await toList();
    for (var o in data) {
      list.add(o.toMap(forJson: true));
    }
    return json.encode(list);
  }

  /// This method returns Json String. [MessageGroup]
  @override
  Future<String> toJsonWithChilds() async {
    final list = <dynamic>[];
    final data = await toList();
    for (var o in data) {
      list.add(await o.toMapWithChildren(false, true));
    }
    return json.encode(list);
  }

  /// This method returns List<dynamic>. [MessageGroup]
  /// <returns>List<dynamic>
  @override
  Future<List<dynamic>> toMapList() async {
    buildParameters();
    return await _mnMessageGroup!.toList(qparams);
  }

  /// This method returns Primary Key List SQL and Parameters retVal = Map<String,dynamic>. [MessageGroup]
  /// retVal['sql'] = SQL statement string, retVal['args'] = whereArguments List<dynamic>;
  /// <returns>List<String>
  @override
  Map<String, dynamic> toListPrimaryKeySQL([bool buildParams = true]) {
    final Map<String, dynamic> _retVal = <String, dynamic>{};
    if (buildParams) {
      buildParameters();
    }
    _retVal['sql'] =
        'SELECT `seqId` FROM messageGroup WHERE ${qparams.whereString}';
    _retVal['args'] = qparams.whereArguments;
    return _retVal;
  }

  /// This method returns Primary Key List<int>.
  /// <returns>List<int>
  @override
  Future<List<int>> toListPrimaryKey([bool buildParams = true]) async {
    if (buildParams) {
      buildParameters();
    }
    final List<int> seqIdData = <int>[];
    qparams.selectColumns = ['seqId'];
    final seqIdFuture = await _mnMessageGroup!.toList(qparams);

    final int count = seqIdFuture.length;
    for (int i = 0; i < count; i++) {
      seqIdData.add(seqIdFuture[i]['seqId'] as int);
    }
    return seqIdData;
  }

  /// Returns List<dynamic> for selected columns. Use this method for 'groupBy' with min,max,avg..  [MessageGroup]
  /// Sample usage: (see EXAMPLE 4.2 at https://github.com/hhtokpinar/sqfEntity#group-by)
  @override
  Future<List<dynamic>> toListObject() async {
    buildParameters();

    final objectFuture = _mnMessageGroup!.toList(qparams);

    final List<dynamic> objectsData = <dynamic>[];
    final data = await objectFuture;
    final int count = data.length;
    for (int i = 0; i < count; i++) {
      objectsData.add(data[i]);
    }
    return objectsData;
  }

  /// Returns List<String> for selected first column
  /// Sample usage: await MessageGroup.select(columnsToSelect: ['columnName']).toListString()
  @override
  Future<List<String>> toListString(
      [VoidCallback Function(List<String> o)? listString]) async {
    buildParameters();

    final objectFuture = _mnMessageGroup!.toList(qparams);

    final List<String> objectsData = <String>[];
    final data = await objectFuture;
    final int count = data.length;
    for (int i = 0; i < count; i++) {
      objectsData.add(data[i][qparams.selectColumns![0]].toString());
    }
    if (listString != null) {
      listString(objectsData);
    }
    return objectsData;
  }
}
// endregion MessageGroupFilterBuilder

// region MessageGroupFields
class MessageGroupFields {
  static TableField? _fSeqId;
  static TableField get seqId {
    return _fSeqId =
        _fSeqId ?? SqlSyntax.setField(_fSeqId, 'seqid', DbType.integer);
  }

  static TableField? _fAccount;
  static TableField get account {
    return _fAccount =
        _fAccount ?? SqlSyntax.setField(_fAccount, 'account', DbType.text);
  }

  static TableField? _fId;
  static TableField get id {
    return _fId = _fId ?? SqlSyntax.setField(_fId, 'id', DbType.integer);
  }

  static TableField? _fName;
  static TableField get name {
    return _fName = _fName ?? SqlSyntax.setField(_fName, 'name', DbType.text);
  }
}
// endregion MessageGroupFields

//region MessageGroupManager
class MessageGroupManager extends SqfEntityProvider {
  MessageGroupManager()
      : super(MessageGroupModel(),
            tableName: _tableName,
            primaryKeyList: _primaryKeyList,
            whereStr: _whereStr);
  static const String _tableName = 'messageGroup';
  static const List<String> _primaryKeyList = ['seqId'];
  static const String _whereStr = 'seqId=?';
}

//endregion MessageGroupManager
/// Region SEQUENCE IdentitySequence
class IdentitySequence {
  /// Assigns a new value when it is triggered and returns the new value
  /// returns Future<int>
  Future<int> nextVal([VoidCallback Function(int o)? nextval]) async {
    final val = await MessageGroupModelSequenceManager()
        .sequence(SequenceIdentitySequence.getInstance, true);
    if (nextval != null) {
      nextval(val);
    }
    return val;
  }

  /// Get the current value
  /// returns Future<int>
  Future<int> currentVal([VoidCallback Function(int o)? currentval]) async {
    final val = await MessageGroupModelSequenceManager()
        .sequence(SequenceIdentitySequence.getInstance, false);
    if (currentval != null) {
      currentval(val);
    }
    return val;
  }

  /// Reset sequence to start value
  /// returns start value
  Future<int> reset([VoidCallback Function(int o)? currentval]) async {
    final val = await MessageGroupModelSequenceManager()
        .sequence(SequenceIdentitySequence.getInstance, false, reset: true);
    if (currentval != null) {
      currentval(val);
    }
    return val;
  }
}

/// End Region SEQUENCE IdentitySequence

class MessageGroupModelSequenceManager extends SqfEntityProvider {
  MessageGroupModelSequenceManager() : super(MessageGroupModel());
}
// END OF ENTITIES
