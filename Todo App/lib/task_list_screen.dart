import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/add_task_screen.dart';
import 'package:todo_app/database_helper.dart';
import 'package:todo_app/task.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  bool checkStatus = true;
  late Future<List<Task>> _task;
  final DateFormat _dateFormat = DateFormat('MMM dd, yyyy, hh : mm');

  Widget _buildItem(Task task) {
    return Container(
      padding: EdgeInsets.all(2.0),
      child: ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AddTaskScreen(
              updateTaskList: _updateTaslList,
              task: task,
            ),
          ),
        ),
        title: Text(
          task.title,
          style: TextStyle(
              decoration: task.status == 0
                  ? TextDecoration.none
                  : TextDecoration.lineThrough),
        ),
        subtitle: Text(
          _dateFormat.format(
            task.date,
          ),
          style: TextStyle(
              decoration: task.status == 0
                  ? TextDecoration.none
                  : TextDecoration.lineThrough),
        ),
        trailing: Checkbox(
          value: task.status == 0 ? false : true,
          onChanged: (bool? value) {
            if (value != null) task.status = value ? 1 : 0;
            DatabaseHelper.instance.updateTask(task);
            _updateTaslList();
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    _updateTaslList();
    super.initState();
  }

  void _updateTaslList() {
    setState(() {
      _task = DatabaseHelper.instance.getTaskList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddTaskScreen(
                updateTaskList: _updateTaslList,
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: FutureBuilder(
            future: _task,
            builder: (context, AsyncSnapshot snapshot) {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {

                  final int completedTasks = snapshot.data
                  .where((Task task) => task.status == 1)
                  .toList()
                  .length;

                  if (index == 0) {
                    return Container(
                      child: Row(
                        children:  [
                          const Text(
                            'My tasks',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Text(
                            ' $completedTasks / ${snapshot.data.length}',
                            style: const TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      child: _buildItem(snapshot.data[index - 1]),
                    );
                  }
                },
                itemCount: snapshot.data.length + 1,
              );
            }),
      ),
    );
  }
}
