import 'package:flutter/material.dart';
import 'todo.dart';
import 'done_list.dart';

class DoneListScreen extends StatefulWidget{
  DoneListScreen({@required this.dones, this.todos});

  final List<Todo> dones;
  final List<Todo> todos;

  @override
  _DoneListScreenState createState() => _DoneListScreenState();
}

class _DoneListScreenState extends State<DoneListScreen>{

  _toggleTodo(Todo todo){
    setState(() {
      todo.isDone = false;
      widget.dones.remove(todo);
      widget.todos.add(todo);
    });
  }

  _clearDones(){
    setState(() {
      widget.dones.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoneList(
        dones: widget.dones,
        onTodoToggle: _toggleTodo,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.clear_all),
          onPressed: (){
            _clearDones();
          }
      ),
    );
  }
}