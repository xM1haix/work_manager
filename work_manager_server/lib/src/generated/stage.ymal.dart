/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Stage implements _i1.TableRow, _i1.ProtocolSerialization {
  Stage._({
    this.id,
    required this.name,
    this.status,
    this.deletedAt,
    required this.jobId,
  });

  factory Stage({
    int? id,
    required String name,
    bool? status,
    DateTime? deletedAt,
    required int jobId,
  }) = _StageImpl;

  factory Stage.fromJson(Map<String, dynamic> jsonSerialization) {
    return Stage(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      status: jsonSerialization['status'] as bool?,
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
      jobId: jsonSerialization['jobId'] as int,
    );
  }

  static final t = StageTable();

  static const db = StageRepository._();

  @override
  int? id;

  String name;

  bool? status;

  DateTime? deletedAt;

  int jobId;

  @override
  _i1.Table get table => t;

  Stage copyWith({
    int? id,
    String? name,
    bool? status,
    DateTime? deletedAt,
    int? jobId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (status != null) 'status': status,
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
      'jobId': jobId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (status != null) 'status': status,
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
      'jobId': jobId,
    };
  }

  static StageInclude include() {
    return StageInclude._();
  }

  static StageIncludeList includeList({
    _i1.WhereExpressionBuilder<StageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StageTable>? orderByList,
    StageInclude? include,
  }) {
    return StageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Stage.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Stage.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StageImpl extends Stage {
  _StageImpl({
    int? id,
    required String name,
    bool? status,
    DateTime? deletedAt,
    required int jobId,
  }) : super._(
          id: id,
          name: name,
          status: status,
          deletedAt: deletedAt,
          jobId: jobId,
        );

  @override
  Stage copyWith({
    Object? id = _Undefined,
    String? name,
    Object? status = _Undefined,
    Object? deletedAt = _Undefined,
    int? jobId,
  }) {
    return Stage(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      status: status is bool? ? status : this.status,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
      jobId: jobId ?? this.jobId,
    );
  }
}

class StageTable extends _i1.Table {
  StageTable({super.tableRelation}) : super(tableName: 'stages') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    status = _i1.ColumnBool(
      'status',
      this,
    );
    deletedAt = _i1.ColumnDateTime(
      'deletedAt',
      this,
    );
    jobId = _i1.ColumnInt(
      'jobId',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnBool status;

  late final _i1.ColumnDateTime deletedAt;

  late final _i1.ColumnInt jobId;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        status,
        deletedAt,
        jobId,
      ];
}

class StageInclude extends _i1.IncludeObject {
  StageInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Stage.t;
}

class StageIncludeList extends _i1.IncludeList {
  StageIncludeList._({
    _i1.WhereExpressionBuilder<StageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Stage.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Stage.t;
}

class StageRepository {
  const StageRepository._();

  Future<List<Stage>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Stage>(
      where: where?.call(Stage.t),
      orderBy: orderBy?.call(Stage.t),
      orderByList: orderByList?.call(Stage.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Stage?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StageTable>? where,
    int? offset,
    _i1.OrderByBuilder<StageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Stage>(
      where: where?.call(Stage.t),
      orderBy: orderBy?.call(Stage.t),
      orderByList: orderByList?.call(Stage.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Stage?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Stage>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Stage>> insert(
    _i1.Session session,
    List<Stage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Stage>(
      rows,
      transaction: transaction,
    );
  }

  Future<Stage> insertRow(
    _i1.Session session,
    Stage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Stage>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Stage>> update(
    _i1.Session session,
    List<Stage> rows, {
    _i1.ColumnSelections<StageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Stage>(
      rows,
      columns: columns?.call(Stage.t),
      transaction: transaction,
    );
  }

  Future<Stage> updateRow(
    _i1.Session session,
    Stage row, {
    _i1.ColumnSelections<StageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Stage>(
      row,
      columns: columns?.call(Stage.t),
      transaction: transaction,
    );
  }

  Future<List<Stage>> delete(
    _i1.Session session,
    List<Stage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Stage>(
      rows,
      transaction: transaction,
    );
  }

  Future<Stage> deleteRow(
    _i1.Session session,
    Stage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Stage>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Stage>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<StageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Stage>(
      where: where(Stage.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Stage>(
      where: where?.call(Stage.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
