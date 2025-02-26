import 'package:flutter/material.dart';
import 'package:work_manager_flutter/fab_add.dart';

class StepsList extends StatefulWidget {
  final int id;
  const StepsList(
    this.id, {
    super.key,
  });

  @override
  State<StepsList> createState() => _StepsListState();
}

class _StepsListState extends State<StepsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task #${widget.id}"),
      ),
      floatingActionButton: FabAdd(
        tooltip: "Create new step",
        onPressed: _createNewStep,
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, i) => Padding(
          padding: const EdgeInsets.all(5),
          child: Tooltip(
            message: "Work $i",
            child: InkWell(
              hoverColor: Color(0xFFC0C0C0),
              splashColor: Colors.green,
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
                          "Step $i",
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
                    SizedBox(height: 20),
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
    );
  }

  void _createNewStep() {}
}
