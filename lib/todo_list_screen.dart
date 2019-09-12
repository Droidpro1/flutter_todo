import 'package:flutter/material.dart';
import 'todo.dart';
import 'new_todo_dialog.dart';
import 'todo_list.dart';
import 'dart:async';

class TodoListScreen extends StatefulWidget {
  TodoListScreen({@required this.todos, this.dones});

  final List<Todo> todos;
  final List<Todo> dones;

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {

  _toggleTodo(Todo todo, bool isChecked){
    setState(() {
      todo.isDone = true;
    });
    Timer(Duration(milliseconds: 600), (){
      setState(() {
        widget.dones.add(todo);
        widget.todos.remove(todo);
      });
    });
  }

  _addTodo() async{
    final todo = await showDialog<Todo>(
        context: context,
        builder: (BuildContext context){
          return NewTodoDialog();
        }
    );
    if (todo != null){
      setState(() {
        widget.todos.add(todo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TodoList(
        todos: widget.todos,
        onTodoToggle: _toggleTodo,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTodo,
      ),
    );
  }
}