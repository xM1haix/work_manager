import "package:work_manager_server/src/generated/protocol.dart";

extension ExtensionOnTeam on Team {
  SimpleTeam get toSimpleTeam => id == null
      ? throw Exception("No id")
      : SimpleTeam(id: id!, name: name, isPrivate: isPrivate, ownerId: ownerId);
}
