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
import 'dart:async' as _i2;
import 'package:work_manager_client/src/protocol/team.ymal.dart' as _i3;
import 'package:work_manager_client/src/protocol/simple_team.ymal.dart' as _i4;
import 'package:work_manager_client/src/protocol/user.ymal.dart' as _i5;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i6;
import 'protocol.dart' as _i7;

/// {@category Endpoint}
class EndpointTeamsEndpoints extends _i1.EndpointRef {
  EndpointTeamsEndpoints(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'teamsEndpoints';

  _i2.Future<bool> create(
    String name, {
    required bool isPrivate,
  }) =>
      caller.callServerEndpoint<bool>(
        'teamsEndpoints',
        'create',
        {
          'name': name,
          'isPrivate': isPrivate,
        },
      );

  _i2.Future<bool> delete(int id) => caller.callServerEndpoint<bool>(
        'teamsEndpoints',
        'delete',
        {'id': id},
      );

  _i2.Future<bool> hide(int id) => caller.callServerEndpoint<bool>(
        'teamsEndpoints',
        'hide',
        {'id': id},
      );

  _i2.Future<_i3.Team> read(int id) => caller.callServerEndpoint<_i3.Team>(
        'teamsEndpoints',
        'read',
        {'id': id},
      );

  _i2.Future<List<_i3.Team>> readList() =>
      caller.callServerEndpoint<List<_i3.Team>>(
        'teamsEndpoints',
        'readList',
        {},
      );

  _i2.Future<List<_i4.SimpleTeam>> simpleRead() =>
      caller.callServerEndpoint<List<_i4.SimpleTeam>>(
        'teamsEndpoints',
        'simpleRead',
        {},
      );

  _i2.Future<List<_i5.User>> userList(int id) =>
      caller.callServerEndpoint<List<_i5.User>>(
        'teamsEndpoints',
        'userList',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointUserData extends _i1.EndpointRef {
  EndpointUserData(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userData';

  _i2.Future<String> getUsername() => caller.callServerEndpoint<String>(
        'userData',
        'getUsername',
        {},
      );
}

/// {@category Endpoint}
class EndpointUserEndpoints extends _i1.EndpointRef {
  EndpointUserEndpoints(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userEndpoints';

  _i2.Future<List<_i5.User>> searchByName(String key) =>
      caller.callServerEndpoint<List<_i5.User>>(
        'userEndpoints',
        'searchByName',
        {'key': key},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i6.Caller(client);
  }

  late final _i6.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i7.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    teamsEndpoints = EndpointTeamsEndpoints(this);
    userData = EndpointUserData(this);
    userEndpoints = EndpointUserEndpoints(this);
    modules = Modules(this);
  }

  late final EndpointTeamsEndpoints teamsEndpoints;

  late final EndpointUserData userData;

  late final EndpointUserEndpoints userEndpoints;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'teamsEndpoints': teamsEndpoints,
        'userData': userData,
        'userEndpoints': userEndpoints,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
