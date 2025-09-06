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

abstract class Team implements _i1.SerializableModel {
  Team._({
    this.id,
    required this.name,
    bool? isPrivate,
    this.deletedAt,
    required this.ownerId,
  }) : isPrivate = isPrivate ?? false;

  factory Team({
    int? id,
    required String name,
    bool? isPrivate,
    DateTime? deletedAt,
    required int ownerId,
  }) = _TeamImpl;

  factory Team.fromJson(Map<String, dynamic> jsonSerialization) {
    return Team(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      isPrivate: jsonSerialization['isPrivate'] as bool,
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
      ownerId: jsonSerialization['ownerId'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  bool isPrivate;

  DateTime? deletedAt;

  int ownerId;

  /// Returns a shallow copy of this [Team]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Team copyWith({
    int? id,
    String? name,
    bool? isPrivate,
    DateTime? deletedAt,
    int? ownerId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'isPrivate': isPrivate,
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
      'ownerId': ownerId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TeamImpl extends Team {
  _TeamImpl({
    int? id,
    required String name,
    bool? isPrivate,
    DateTime? deletedAt,
    required int ownerId,
  }) : super._(
          id: id,
          name: name,
          isPrivate: isPrivate,
          deletedAt: deletedAt,
          ownerId: ownerId,
        );

  /// Returns a shallow copy of this [Team]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Team copyWith({
    Object? id = _Undefined,
    String? name,
    bool? isPrivate,
    Object? deletedAt = _Undefined,
    int? ownerId,
  }) {
    return Team(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      isPrivate: isPrivate ?? this.isPrivate,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
      ownerId: ownerId ?? this.ownerId,
    );
  }
}
