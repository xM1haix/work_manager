/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Job implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  bool? status;

  int teamId;

  DateTime? deletedAt;

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
