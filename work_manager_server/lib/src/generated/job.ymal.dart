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

abstract class Job implements _i1.TableRow, _i1.ProtocolSerialization {
  Job._({
    this.id,
    required this.name,
    this.status,
    required this.teamId,
    this.deletedAt,
  });

  factory Job({
    int? id,
    required String name,
    bool? status,
    required int teamId,
    DateTime? deletedAt,
  }) = _JobImpl;

  factory Job.fromJson(Map<String, dynamic> jsonSerialization) {
    return Job(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      status: jsonSerialization['status'] as bool?,
      teamId: jsonSerialization['teamId'] as int,
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
    );
  }

  static final t = JobTable();

  static const db = JobRepository._();

  @override
  int? id;

  String name;

  bool? status;

  int teamId;

  DateTime? deletedAt;

  @override
  _i1.Table get table => t;

  Job copyWith({
    int? id,
    String? name,
    bool? status,
    int? teamId,
    DateTime? deletedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (status != null) 'status': status,
      'teamId': teamId,
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (status != null) 'status': status,
      'teamId': teamId,
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
    };
  }

  static JobInclude include() {
    return JobInclude._();
  }

  static JobIncludeList includeList({
    _i1.WhereExpressionBuilder<JobTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<JobTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<JobTable>? orderByList,
    JobInclude? include,
  }) {
    return JobIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Job.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Job.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _JobImpl extends Job {
  _JobImpl({
    int? id,
    required String name,
    bool? status,
    required int teamId,
    DateTime? deletedAt,
  }) : super._(
          id: id,
          name: name,
          status: status,
          teamId: teamId,
          deletedAt: deletedAt,
        );

  @override
  Job copyWith({
    Object? id = _Undefined,
    String? name,
    Object? status = _Undefined,
    int? teamId,
    Object? deletedAt = _Undefined,
  }) {
    return Job(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      status: status is bool? ? status : this.status,
      teamId: teamId ?? this.teamId,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
    );
  }
}

class JobTable extends _i1.Table {
  JobTable({super.tableRelation}) : super(tableName: 'jobs') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    status = _i1.ColumnBool(
      'status',
      this,
    );
    teamId = _i1.ColumnInt(
      'teamId',
      this,
    );
    deletedAt = _i1.ColumnDateTime(
      'deletedAt',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnBool status;

  late final _i1.ColumnInt teamId;

  late final _i1.ColumnDateTime deletedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        status,
        teamId,
        deletedAt,
      ];
}

class JobInclude extends _i1.IncludeObject {
  JobInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Job.t;
}

class JobIncludeList extends _i1.IncludeList {
  JobIncludeList._({
    _i1.WhereExpressionBuilder<JobTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Job.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Job.t;
}

class JobRepository {
  const JobRepository._();

  Future<List<Job>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<JobTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<JobTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<JobTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Job>(
      where: where?.call(Job.t),
      orderBy: orderBy?.call(Job.t),
      orderByList: orderByList?.call(Job.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Job?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<JobTable>? where,
    int? offset,
    _i1.OrderByBuilder<JobTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<JobTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Job>(
      where: where?.call(Job.t),
      orderBy: orderBy?.call(Job.t),
      orderByList: orderByList?.call(Job.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Job?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Job>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Job>> insert(
    _i1.Session session,
    List<Job> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Job>(
      rows,
      transaction: transaction,
    );
  }

  Future<Job> insertRow(
    _i1.Session session,
    Job row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Job>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Job>> update(
    _i1.Session session,
    List<Job> rows, {
    _i1.ColumnSelections<JobTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Job>(
      rows,
      columns: columns?.call(Job.t),
      transaction: transaction,
    );
  }

  Future<Job> updateRow(
    _i1.Session session,
    Job row, {
    _i1.ColumnSelections<JobTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Job>(
      row,
      columns: columns?.call(Job.t),
      transaction: transaction,
    );
  }

  Future<List<Job>> delete(
    _i1.Session session,
    List<Job> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Job>(
      rows,
      transaction: transaction,
    );
  }

  Future<Job> deleteRow(
    _i1.Session session,
    Job row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Job>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Job>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<JobTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Job>(
      where: where(Job.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<JobTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Job>(
      where: where?.call(Job.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
