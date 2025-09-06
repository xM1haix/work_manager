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

abstract class Job implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Job]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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

  /// Returns a shallow copy of this [Job]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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

class JobTable extends _i1.Table<int?> {
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
  _i1.Table<int?> get table => Job.t;
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
  _i1.Table<int?> get table => Job.t;
}

class JobRepository {
  const JobRepository._();

  /// Returns a list of [Job]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
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

  /// Returns the first matching [Job] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
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

  /// Finds a single [Job] by its [id] or null if no such row exists.
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

  /// Inserts all [Job]s in the list and returns the inserted rows.
  ///
  /// The returned [Job]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
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

  /// Inserts a single [Job] and returns the inserted row.
  ///
  /// The returned [Job] will have its `id` field set.
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

  /// Updates all [Job]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
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

  /// Updates a single [Job]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
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

  /// Deletes all [Job]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
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

  /// Deletes a single [Job].
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

  /// Deletes all rows matching the [where] expression.
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

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
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
