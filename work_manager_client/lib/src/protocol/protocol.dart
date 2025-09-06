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
import 'custom_exception.ymal.dart' as _i2;
import 'job.ymal.dart' as _i3;
import 'simple_team.ymal.dart' as _i4;
import 'stage.ymal.dart' as _i5;
import 'team.ymal.dart' as _i6;
import 'team_user.ymal.dart' as _i7;
import 'user.ymal.dart' as _i8;
import 'user_permission.ymal.dart' as _i9;
import 'package:work_manager_client/src/protocol/team.ymal.dart' as _i10;
import 'package:work_manager_client/src/protocol/simple_team.ymal.dart' as _i11;
import 'package:work_manager_client/src/protocol/user.ymal.dart' as _i12;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i13;
export 'custom_exception.ymal.dart';
export 'job.ymal.dart';
export 'simple_team.ymal.dart';
export 'stage.ymal.dart';
export 'team.ymal.dart';
export 'team_user.ymal.dart';
export 'user.ymal.dart';
export 'user_permission.ymal.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.CustomException) {
      return _i2.CustomException.fromJson(data) as T;
    }
    if (t == _i3.Job) {
      return _i3.Job.fromJson(data) as T;
    }
    if (t == _i4.SimpleTeam) {
      return _i4.SimpleTeam.fromJson(data) as T;
    }
    if (t == _i5.Stage) {
      return _i5.Stage.fromJson(data) as T;
    }
    if (t == _i6.Team) {
      return _i6.Team.fromJson(data) as T;
    }
    if (t == _i7.TeamUser) {
      return _i7.TeamUser.fromJson(data) as T;
    }
    if (t == _i8.User) {
      return _i8.User.fromJson(data) as T;
    }
    if (t == _i9.UserPermission) {
      return _i9.UserPermission.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.CustomException?>()) {
      return (data != null ? _i2.CustomException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Job?>()) {
      return (data != null ? _i3.Job.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.SimpleTeam?>()) {
      return (data != null ? _i4.SimpleTeam.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Stage?>()) {
      return (data != null ? _i5.Stage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Team?>()) {
      return (data != null ? _i6.Team.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.TeamUser?>()) {
      return (data != null ? _i7.TeamUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.User?>()) {
      return (data != null ? _i8.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.UserPermission?>()) {
      return (data != null ? _i9.UserPermission.fromJson(data) : null) as T;
    }
    if (t == List<_i10.Team>) {
      return (data as List).map((e) => deserialize<_i10.Team>(e)).toList() as T;
    }
    if (t == List<_i11.SimpleTeam>) {
      return (data as List).map((e) => deserialize<_i11.SimpleTeam>(e)).toList()
          as T;
    }
    if (t == List<_i12.User>) {
      return (data as List).map((e) => deserialize<_i12.User>(e)).toList() as T;
    }
    try {
      return _i13.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.CustomException) {
      return 'CustomException';
    }
    if (data is _i3.Job) {
      return 'Job';
    }
    if (data is _i4.SimpleTeam) {
      return 'SimpleTeam';
    }
    if (data is _i5.Stage) {
      return 'Stage';
    }
    if (data is _i6.Team) {
      return 'Team';
    }
    if (data is _i7.TeamUser) {
      return 'TeamUser';
    }
    if (data is _i8.User) {
      return 'User';
    }
    if (data is _i9.UserPermission) {
      return 'UserPermission';
    }
    className = _i13.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'CustomException') {
      return deserialize<_i2.CustomException>(data['data']);
    }
    if (dataClassName == 'Job') {
      return deserialize<_i3.Job>(data['data']);
    }
    if (dataClassName == 'SimpleTeam') {
      return deserialize<_i4.SimpleTeam>(data['data']);
    }
    if (dataClassName == 'Stage') {
      return deserialize<_i5.Stage>(data['data']);
    }
    if (dataClassName == 'Team') {
      return deserialize<_i6.Team>(data['data']);
    }
    if (dataClassName == 'TeamUser') {
      return deserialize<_i7.TeamUser>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i8.User>(data['data']);
    }
    if (dataClassName == 'UserPermission') {
      return deserialize<_i9.UserPermission>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i13.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
