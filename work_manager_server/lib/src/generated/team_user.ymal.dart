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
import 'user_permission.ymal.dart' as _i2;

abstract class TeamUser implements _i1.TableRow, _i1.ProtocolSerialization {
  TeamUser._({
    this.id,
    required this.teamId,
    required this.userId,
    this.deletedAt,
    _i2.UserPermission? permission,
  }) : permission = permission ?? _i2.UserPermission.viewer;

  factory TeamUser({
    int? id,
    required int teamId,
    required int userId,
    DateTime? deletedAt,
    _i2.UserPermission? permission,
  }) = _TeamUserImpl;

  factory TeamUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return TeamUser(
      id: jsonSerialization['id'] as int?,
      teamId: jsonSerialization['teamId'] as int,
      userId: jsonSerialization['userId'] as int,
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
      permission:
          _i2.UserPermission.fromJson((jsonSerialization['permission'] as int)),
    );
  }

  static final t = TeamUserTable();

  static const db = TeamUserRepository._();

  @override
  int? id;

  int teamId;

  int userId;

  DateTime? deletedAt;

  _i2.UserPermission permission;

  @override
  _i1.Table get table => t;

  TeamUser copyWith({
    int? id,
    int? teamId,
    int? userId,
    DateTime? deletedAt,
    _i2.UserPermission? permission,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'teamId': teamId,
      'userId': userId,
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
      'permission': permission.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'teamId': teamId,
      'userId': userId,
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
      'permission': permission.toJson(),
    };
  }

  static TeamUserInclude include() {
    return TeamUserInclude._();
  }

  static TeamUserIncludeList includeList({
    _i1.WhereExpressionBuilder<TeamUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TeamUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TeamUserTable>? orderByList,
    TeamUserInclude? include,
  }) {
    return TeamUserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TeamUser.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TeamUser.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TeamUserImpl extends TeamUser {
  _TeamUserImpl({
    int? id,
    required int teamId,
    required int userId,
    DateTime? deletedAt,
    _i2.UserPermission? permission,
  }) : super._(
          id: id,
          teamId: teamId,
          userId: userId,
          deletedAt: deletedAt,
          permission: permission,
        );

  @override
  TeamUser copyWith({
    Object? id = _Undefined,
    int? teamId,
    int? userId,
    Object? deletedAt = _Undefined,
    _i2.UserPermission? permission,
  }) {
    return TeamUser(
      id: id is int? ? id : this.id,
      teamId: teamId ?? this.teamId,
      userId: userId ?? this.userId,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
      permission: permission ?? this.permission,
    );
  }
}

class TeamUserTable extends _i1.Table {
  TeamUserTable({super.tableRelation}) : super(tableName: 'team_users') {
    teamId = _i1.ColumnInt(
      'teamId',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    deletedAt = _i1.ColumnDateTime(
      'deletedAt',
      this,
    );
    permission = _i1.ColumnEnum(
      'permission',
      this,
      _i1.EnumSerialization.byIndex,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt teamId;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnDateTime deletedAt;

  late final _i1.ColumnEnum<_i2.UserPermission> permission;

  @override
  List<_i1.Column> get columns => [
        id,
        teamId,
        userId,
        deletedAt,
        permission,
      ];
}

class TeamUserInclude extends _i1.IncludeObject {
  TeamUserInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => TeamUser.t;
}

class TeamUserIncludeList extends _i1.IncludeList {
  TeamUserIncludeList._({
    _i1.WhereExpressionBuilder<TeamUserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TeamUser.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => TeamUser.t;
}

class TeamUserRepository {
  const TeamUserRepository._();

  Future<List<TeamUser>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TeamUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TeamUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TeamUserTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<TeamUser>(
      where: where?.call(TeamUser.t),
      orderBy: orderBy?.call(TeamUser.t),
      orderByList: orderByList?.call(TeamUser.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<TeamUser?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TeamUserTable>? where,
    int? offset,
    _i1.OrderByBuilder<TeamUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TeamUserTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<TeamUser>(
      where: where?.call(TeamUser.t),
      orderBy: orderBy?.call(TeamUser.t),
      orderByList: orderByList?.call(TeamUser.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<TeamUser?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<TeamUser>(
      id,
      transaction: transaction,
    );
  }

  Future<List<TeamUser>> insert(
    _i1.Session session,
    List<TeamUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<TeamUser>(
      rows,
      transaction: transaction,
    );
  }

  Future<TeamUser> insertRow(
    _i1.Session session,
    TeamUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TeamUser>(
      row,
      transaction: transaction,
    );
  }

  Future<List<TeamUser>> update(
    _i1.Session session,
    List<TeamUser> rows, {
    _i1.ColumnSelections<TeamUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TeamUser>(
      rows,
      columns: columns?.call(TeamUser.t),
      transaction: transaction,
    );
  }

  Future<TeamUser> updateRow(
    _i1.Session session,
    TeamUser row, {
    _i1.ColumnSelections<TeamUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TeamUser>(
      row,
      columns: columns?.call(TeamUser.t),
      transaction: transaction,
    );
  }

  Future<List<TeamUser>> delete(
    _i1.Session session,
    List<TeamUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TeamUser>(
      rows,
      transaction: transaction,
    );
  }

  Future<TeamUser> deleteRow(
    _i1.Session session,
    TeamUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TeamUser>(
      row,
      transaction: transaction,
    );
  }

  Future<List<TeamUser>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TeamUserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TeamUser>(
      where: where(TeamUser.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TeamUserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TeamUser>(
      where: where?.call(TeamUser.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
