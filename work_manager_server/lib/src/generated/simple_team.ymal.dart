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

abstract class SimpleTeam
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  SimpleTeam._({
    required this.id,
    required this.name,
    required this.isPrivate,
    required this.ownerId,
  });

  factory SimpleTeam({
    required int id,
    required String name,
    required bool isPrivate,
    required int ownerId,
  }) = _SimpleTeamImpl;

  factory SimpleTeam.fromJson(Map<String, dynamic> jsonSerialization) {
    return SimpleTeam(
      id: jsonSerialization['id'] as int,
      name: jsonSerialization['name'] as String,
      isPrivate: jsonSerialization['isPrivate'] as bool,
      ownerId: jsonSerialization['ownerId'] as int,
    );
  }

  int id;

  String name;

  bool isPrivate;

  int ownerId;

  SimpleTeam copyWith({
    int? id,
    String? name,
    bool? isPrivate,
    int? ownerId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isPrivate': isPrivate,
      'ownerId': ownerId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id,
      'name': name,
      'isPrivate': isPrivate,
      'ownerId': ownerId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SimpleTeamImpl extends SimpleTeam {
  _SimpleTeamImpl({
    required int id,
    required String name,
    required bool isPrivate,
    required int ownerId,
  }) : super._(
          id: id,
          name: name,
          isPrivate: isPrivate,
          ownerId: ownerId,
        );

  @override
  SimpleTeam copyWith({
    int? id,
    String? name,
    bool? isPrivate,
    int? ownerId,
  }) {
    return SimpleTeam(
      id: id ?? this.id,
      name: name ?? this.name,
      isPrivate: isPrivate ?? this.isPrivate,
      ownerId: ownerId ?? this.ownerId,
    );
  }
}
