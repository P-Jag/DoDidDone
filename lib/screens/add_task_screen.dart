import 'package:flutter/material.dart';
import 'package:do_did_done/constants.dart';
import 'package:provider/provider.dart';
import 'package:do_did_done/modules/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(kMeasure),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: kTopBordersRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'New Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: kMeasure,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                Provider.of<TaskData>(context).addTask(newTaskTitle);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
