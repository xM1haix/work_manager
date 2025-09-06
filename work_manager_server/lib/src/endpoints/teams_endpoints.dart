import "package:serverpod/serverpod.dart";
import "package:work_manager_server/error.dart";
import "package:work_manager_server/get_current_user.dart";
import "package:work_manager_server/src/generated/protocol.dart";
import "package:work_manager_server/team_to_simple_team.dart";

class TeamsEndpoints extends Endpoint {
  Future<bool> create(
    Session session,
    String name, {
    required bool isPrivate,
  }) async {
    final userId = (await getCurrentUser(session)).userId;
    final createdTeam = await Team.db.insertRow(
      session,
      Team(
        name: name,
        ownerId: userId,
        isPrivate: isPrivate,
      ),
    );
    if (createdTeam.id == null) {
      throwErr("Something wrong while creating team: Team id is null");
    }
    final newTeamUser = await TeamUser.db
        .insertRow(session, TeamUser(teamId: createdTeam.id!, userId: userId));
    if (newTeamUser.id == null) {
      throwErr("Something wrong while creating TeamUser: TeamUser id is null");
    }
    return true;
  }

  Future<bool> delete(Session session, int id) async {
    final userId = (await getCurrentUser(session)).userId;
    final users = await TeamUser.db.findFirstRow(
      session,
      where: (teamUser) =>
          teamUser.teamId.equals(id) & teamUser.userId.equals(userId),
    );
    if (users == null) {
      throwErr("You are not included in this team");
    }

    await Team.db.deleteWhere(session, where: (team) => team.id.equals(id));
    final currentTeam = await Team.db.findById(session, id);
    if (currentTeam == null) {
      throwErr("Team doesn't exist");
    }
    if (currentTeam.deletedAt != null) {
      throwErr("Team already hidden");
    }
    await Team.db
        .updateRow(session, currentTeam.copyWith(deletedAt: DateTime.now()));
    return true;
  }

  Future<bool> hide(Session session, int id) async {
    final userId = (await getCurrentUser(session)).userId;
    final users = await TeamUser.db.findFirstRow(
      session,
      where: (teamUser) =>
          teamUser.teamId.equals(id) & teamUser.userId.equals(userId),
    );
    if (users == null) {
      throwErr("You are not included in this team");
    }
    final currentTeam = await Team.db.findById(session, id);
    if (currentTeam == null) {
      throwErr("Team doesn't exist");
    }
    if (currentTeam.deletedAt != null) {
      throwErr("Team already hidden");
    }
    await Team.db
        .updateRow(session, currentTeam.copyWith(deletedAt: DateTime.now()));
    return true;
  }

  Future<Team> read(Session session, int id) async {
    final userId = (await getCurrentUser(session)).userId;
    final team = await Team.db.findById(session, id);
    if (team == null) {
      throwErr("Cannot find the team");
    }
    final users = await TeamUser.db.findFirstRow(
      session,
      where: (teamUser) =>
          teamUser.teamId.equals(id) & teamUser.userId.equals(userId),
    );
    if (users == null) {
      throwErr("You are not included in this team");
    }
    return team;
  }

  Future<List<Team>> readList(Session session) async {
    final currentUser = await session.authenticated;
    if (currentUser == null) {
      throwErr("User not sign in!");
    }
    final teamUserCombos = await TeamUser.db
        .find(session, where: (e) => e.userId.equals(currentUser.userId));
    final teamIds = <int>[];
    for (final tuc in teamUserCombos) {
      final tId = tuc.teamId;
      if (!teamIds.contains(tId)) {
        teamIds.add(tuc.teamId);
      }
    }
    final teams = <Team>[];
    for (final tid in teamIds) {
      final newTeam = await Team.db.findById(session, tid);
      if (newTeam != null) {
        teams.add(newTeam);
      }
    }
    return teams;
  }

  Future<List<SimpleTeam>> simpleRead(Session session) async {
    final currentUser = await getCurrentUser(session);
    final teamUserCombos = await TeamUser.db
        .find(session, where: (e) => e.userId.equals(currentUser.userId));
    final teamIds = <int>[];
    for (final tuc in teamUserCombos) {
      final tId = tuc.teamId;
      if (!teamIds.contains(tId)) {
        teamIds.add(tuc.teamId);
      }
    }
    final teams = <SimpleTeam>[];
    for (final tid in teamIds) {
      teams.addAll(
        (await Team.db.find(
          session,
          where: (team) => team.id.equals(tid) & team.deletedAt.equals(null),
        ))
            .map((e) => e.toSimpleTeam)
            .toList(),
      );
    }
    return teams;
  }

  Future<List<User>> userList(Session session, int id) async {
    final userId = (await getCurrentUser(session)).userId;
    final currentTeam = await Team.db.findById(session, id);
    if (currentTeam == null) {
      throwErr("Cannot find the team");
    }
    final teamUsers = await TeamUser.db.find(session);
    if (teamUsers.isEmpty) {
      throwErr("Somethign went wrong");
    }
    var isPermited = false;
    final users = <User>[];
    for (final teamUser in teamUsers) {
      final user = await User.db.findById(session, teamUser.userId);
      if (user == null) {
        throwErr(
          "Something went wrong with teamUser.userId: ${teamUser.userId}",
        );
      }
      users.add(user);
      if (teamUser.userId == userId) {
        isPermited = true;
        break;
      }
    }
    if (!isPermited) {
      throwErr("You are not included in this team");
    }
    return users;
  }
}
