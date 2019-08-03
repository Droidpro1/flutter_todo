import 'package:flutter/material.dart';
import 'todo.dart';
import 'new_todo_dialog.dart';
import 'todo_list.dart';

class TodoListScreen extends StatefulWidget {
  TodoListScreen({@required this.todos, this.dones});
  List<Todo> todos;
  List<Todo> dones;
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {

  _toggleTodo(Todo todo, bool isChecked){
    setState(() {
      todo.isDone = true;
      widget.dones.add(todo);
      widget.todos.remove(todo);
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