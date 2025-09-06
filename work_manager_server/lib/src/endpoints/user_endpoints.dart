import "package:serverpod/server.dart";
import "package:work_manager_server/get_current_user.dart";
import "package:work_manager_server/src/generated/protocol.dart";

class UserEndpoints extends Endpoint {
  Future<List<User>> searchByName(Session session, String key) async {
    await getCurrentUser(session);
    return User.db.find(session, where: (user) => user.name.ilike("%$key%"));
  }
}
