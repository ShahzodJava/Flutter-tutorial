import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/database_helper.dart';
import 'package:todo_app/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key, required this.updateTaskList, this.task})
      : super(key: key);
  final Function updateTaskList;
  final Task? task;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String? _title = '';
  DateTime _date = DateTime.now();
  late DateTime _dateWithTime;

  TimeOfDay _selectedTime = TimeOfDay(hour: 00, minute: 000);
  String? _hour, _minute, _time;
  String _priority = 'Low';

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  final DateFormat _dateFormat = DateFormat('MMM dd, yyyy');
  final DateFormat _timeFormat = DateFormat('hh:mm');

  final List<String> _priorities = ['Low', 'Medium', ' High'];
  final _formKey = GlobalKey<FormState>();

  Future<void> _handleDatePicker() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    );

    if (date != _date) {
      setState(() {
        _date = date as DateTime;
      });
      _dateController.text = _dateFormat.format(date!);
    }
  }
  Future<void> _handleTimePicker() async {
    final timePicked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (timePicked != null) {
      setState(() {
        _selectedTime = timePicked;
        _hour = _selectedTime.hour.toString();
        _minute = _selectedTime.minute.toString();
        _time = '$_hour! : $_minute';
        _dateWithTime = DateTime(_date.year, _date.month, _date.day, _selectedTime.hour, _selectedTime.minute);
        _timeController.text = _timeFormat.format(_dateWithTime);
      });
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Task task = Task(title: _title!, date: _dateWithTime, priority: _priority);

      if (widget.task == null) {
        DatabaseHelper.instance.insertTask(task);
      } else {
        task.id = widget.task!.id;
        task.status = widget.task!.status;
        task.title = _title!;
        task.date = _dateWithTime;
        task.priority = _priority;
        DatabaseHelper.instance.updateTask(task);
      }

      widget.updateTaskList();
      Navigator.pop(context);
    }
  }

  void _delete() {
    DatabaseHelper.instance.deleteTask(widget.task!.id);
    widget.updateTaskList();
    Navigator.pop(context);
  }

  @override
  void initState() {
    if (widget.task != null) {
      _title = widget.task!.title;
      _date = widget.task!.date;
      _priority = widget.task!.priority;
    }
    _dateController.text = _dateFormat.format(_date);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Text(
              widget.task == null? 'Create task':'Update task',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Tite',
                    ),
                    onSaved: (input) => _title = input,
                    validator: (input) =>
                        input!.isEmpty ? 'Enter task title' : null,
                    initialValue: _title,
                  ),
                  TextFormField(
                    controller: _dateController,
                    readOnly: true,
                    onTap: _handleDatePicker,
                    decoration: const InputDecoration(labelText: 'Date'),
                  ),
                  TextFormField(
                    controller: _timeController,
                    readOnly: true,
                    onTap: _handleTimePicker,
                    decoration: const InputDecoration(labelText: 'Time'),
                  ),
                  DropdownButtonFormField(
                    icon: const Icon(Icons.arrow_drop_down),
                    decoration: const InputDecoration(labelText: 'Priority'),
                    onSaved: (input) => _priority = input!.toString(),
                    items: _priorities.map((priority) {
                      return DropdownMenuItem(
                        value: priority,
                        child: Text(priority),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _priority = value!;
                      });
                      print(value);
                    },
                    value: _priority,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: _submit, child: const Text('SAVE')),
                TextButton(onPressed: _delete, child: const Text('Delete')),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
