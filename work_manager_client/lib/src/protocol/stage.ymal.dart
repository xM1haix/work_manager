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

abstract class Stage implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  bool? status;

  DateTime? deletedAt;

  int jobId;

  /// Returns a shallow copy of this [Stage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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

  /// Returns a shallow copy of this [Stage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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
