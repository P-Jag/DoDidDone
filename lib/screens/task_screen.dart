import 'package:flutter/material.dart';
import 'package:do_did_done/widgets/tasks_list.dart';
import 'package:do_did_done/screens/add_task_screen.dart';
import 'package:do_did_done/constants.dart';
import 'package:do_did_done/modules/task_data.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 60.0,
              bottom: kMeasure,
              left: kMeasure,
              right: kMeasure,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: kMeasure,
                  child: Icon(
                    Icons.list,
                    size: kMeasure,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'DoDidDone',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} tasks left',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: kTopBordersRadius,
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
