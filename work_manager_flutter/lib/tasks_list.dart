import 'package:flutter/material.dart';
import 'package:work_manager_client/work_manager_client.dart';
import 'package:work_manager_flutter/nav.dart';
import 'package:work_manager_flutter/settings.dart';
import 'package:work_manager_flutter/steps_list.dart';
import 'package:work_manager_flutter/teams.dart';

import 'connect/connect.dart';
import 'create_task.dart';
import 'fab_add.dart';
import 'future_builder.dart';
import 'main.dart';
import 'popup.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  late Future<List<SimpleTeam>> _getTeams;
  late Future<String> _getUsername;
  int? _selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${_selected ?? "All"} your work"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 160,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.green, Colors.white],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: CustomFutureBuilder(
                future: _getUsername,
                success: (username) => Text(
                  username,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Expanded(
              child: CustomFutureBuilder(
                future: _getTeams,
                success: (teams) => teams.isEmpty
                    ? Center(
                        child: Text("You have no teams"),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: teams.length,
                        itemBuilder: (context, i) {
                          final selected = i == _selected;
                          return Padding(
                            padding: const EdgeInsets.all(2),
                            child: Tooltip(
                              message: teams[i].name,
                              child: InkWell(
                                splashColor:
                                    selected ? Colors.black : Colors.green,
                                onTap: () => _changeTeam(teams[i].id),
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  margin: const EdgeInsets.all(3),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: selected
                                        ? Colors.green.withAlpha(0xAA)
                                        : Color(0xAA121212),
                                  ),
                                  child: Text(
                                    teams[i].name,
                                    style: TextStyle(
                                      color: selected
                                          ? Colors.white
                                          : Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  tooltip: "Settings",
                  icon: Icon(
                    Icons.settings,
                  ),
                  onPressed: _goToSettings,
                ),
                IconButton(
                  tooltip: "Manage Teams",
                  icon: Icon(
                    Icons.groups_outlined,
                  ),
                  onPressed: _manageTeams,
                ),
                IconButton(
                  tooltip: "Logout",
                  icon: Icon(
                    Icons.power_settings_new,
                    color: Colors.red,
                  ),
                  onPressed: _logout,
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      floatingActionButton: FabAdd(
        tooltip: "Create new work",
        onPressed: _createNewTask,
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, i) => Padding(
            padding: const EdgeInsets.all(5),
            child: Tooltip(
              message: "Work $i",
              child: InkWell(
                hoverColor: Color(0xFFC0C0C0),
                splashColor: Colors.green,
                onTap: () => _openWork(i),
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xAA121212),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Work $i",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "$i% DONE",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      AnimatedSwitcher(
                        duration: Duration(seconds: 1),
                        child: _selected == null
                            ? SizedBox(height: 20)
                            : Text(
                                "Team $i",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                      ),
                      LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(10),
                        value: i * 1 / 10,
                        minHeight: 5,
                        backgroundColor: Colors.black,
                        color: Colors.green.withAlpha((0xFF * i / 10).ceil()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _changeTeam(int i) {
    setState(() {
      _selected = _selected == i ? null : i;
    });
  }

  void _createNewTask() => nav(context, CreateTask(_selected));

  void _goToSettings() => nav(context, Settings());
  void _init() {
    setState(() {
      _getTeams = client.teamsEndpoints.simpleRead();
      _getUsername = client.userData.getUsername();
    });
  }

  Future<void> _logout() async {
    if (!(await confirmPopup(
      context,
      "Are you sure you want to signout?",
    ))) {
      return;
    }
    try {
      final x = await sessionManager.signOutDevice();
      if (!mounted && !x) return;
      nav(context, const Connect(), true);
    } catch (e) {
      if (!mounted) return;
      errorPopup(context, e);
    }
  }

  void _manageTeams() => nav(context, Teams());
  Future<void> _onRefresh() async {}
  void _openWork(int i) => nav(context, StepsList(i));
}
