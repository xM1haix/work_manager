import "dart:async";

import "package:flutter/material.dart";
import "package:work_manager_flutter/main.dart";
import "package:work_manager_flutter/nav.dart";
import "package:work_manager_flutter/popup.dart";

class CreateTeam extends StatefulWidget {
  const CreateTeam({
    this.teamId,
    super.key,
  });
  final int? teamId;

  @override
  State<CreateTeam> createState() => _CreateTeamState();
}

class _CreateTeamState extends State<CreateTeam> {
  var _isPrivate = false;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.teamId == null ? "Create" : "Edit"} Team"),
      ),
      body: ListView(
        children: [
          TextField(
            controller: _controller,
          ),
          SwitchListTile(
            title: const Text("Set it to private or public team"),
            subtitle: Text(
              "This team is set to ${_isPrivate ? "private" : "public"}",
            ),
            onChanged: _onChanged,
            value: _isPrivate,
          ),
          Center(
            child: TextButton(
              onPressed: _createTeam,
              child: Text(widget.teamId == null ? "Create" : "Update"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: widget.teamId == null ? "Create" : "Update",
        onPressed: widget.teamId == null ? _createTeam : _updateTeam,
        child: Icon(
          widget.teamId == null
              ? Icons.create_new_folder_outlined
              : Icons.save_as_outlined,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    unawaited(_init());
  }

  Future<void> _createTeam() async {
    try {
      final x = await client.teamsEndpoints
          .create(_controller.text, isPrivate: _isPrivate);
      if (!x) {
        throw Exception("Unknown error!");
      }
      if (!mounted) {
        return;
      }
      back(context, true);
    } catch (e) {
      unawaited(errorPopup(context, e));
    }
  }

  Future<void> _init() async {
    final tid = widget.teamId;
    if (tid == null) {
      _isPrivate = false;
      return;
    }
    await client.teamsEndpoints.read(tid).then((t) {
      setState(() {
        _isPrivate = t.isPrivate;
        _controller.text = t.name;
      });
      return t;
    });
  }

  void _onChanged(bool newValue) {
    setState(() {
      _isPrivate = newValue;
    });
  }

  Future<void> _updateTeam() async {
    //update
  }
}
