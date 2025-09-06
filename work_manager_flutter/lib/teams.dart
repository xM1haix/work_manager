import "dart:async";

import "package:flutter/material.dart";
import "package:work_manager_client/work_manager_client.dart";
import "package:work_manager_flutter/create_team.dart";
import "package:work_manager_flutter/fab_add.dart";
import "package:work_manager_flutter/future_builder.dart";
import "package:work_manager_flutter/main.dart";
import "package:work_manager_flutter/nav.dart";
import "package:work_manager_flutter/popup.dart";

class Teams extends StatefulWidget {
  const Teams({super.key});

  @override
  State<Teams> createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  late Future<List<Team>> _getTeams;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FabAdd(
        tooltip: "Create a new team",
        onPressed: _editTeam,
      ),
      appBar: AppBar(
        title: const Text("Teams"),
      ),
      body: CustomFutureBuilder(
        future: _getTeams,
        success: (teams) => ListView.builder(
          itemCount: teams.length,
          itemBuilder: (context, i) {
            final t = teams[i];
            if (t.id == null) {
              return const SizedBox.shrink();
            }
            final name = t.name;
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Tooltip(
                message: name,
                child: InkWell(
                  hoverColor: const Color(0xFFC0C0C0),
                  splashColor: Colors.green,
                  onTap: () => _editTeam(teams[i].id),
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xAA121212),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () => _delete(t),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              tooltip: "Delete",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _delete(Team team) async {
    final id = team.id;
    final name = team.name;
    try {
      if (id == null) {
        throw Exception("Something went wrong");
      }
      if (team.deletedAt == null) {
        final confirm = await confirmPopup(
          context,
          "Are you sure you want to delete this team: $name?",
        );
        if (confirm) {
          return;
        }
        await client.teamsEndpoints.hide(team.id!);
      } else {
        final confirm = await confirmPopup(
          context,
          """This team ($name) is acting as delete (hidden and not working).\nAre you sure you want to completly delete it?\nThis proccess cannot be undone!""",
        );
        if (confirm) {
          return;
        }
        await client.teamsEndpoints.delete(team.id!);
      }
    } catch (e) {
      if (!mounted) {
        return;
      }
      unawaited(errorPopup(context, e));
    }
  }

  Future<void> _editTeam([int? id]) async {
    final shouldRefresh =
        (await nav<bool?>(context, CreateTeam(teamId: id))) ?? false;
    if (shouldRefresh) {
      _init();
    }
  }

  void _init() {
    setState(() {
      _getTeams = client.teamsEndpoints.readList();
    });
  }
}
