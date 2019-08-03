import 'package:flutter/material.dart';
import 'todo.dart';

typedef ToggleTodoCallback = void Function(Todo, bool);

class TodoList extends StatelessWidget{
  TodoList({@required this.todos, this.onTodoToggle}); //I don't really understand this

  final List<Todo> todos;
  final ToggleTodoCallback onTodoToggle; //or this


  Widget _buildItem(BuildContext context, int index){
    final todo = todos[index];

    return CheckboxListTile(
      value: todo.isDone,
      title: Text(todo.title),
      onChanged: (bool isChecked){
        onTodoToggle(todo,isChecked); //or this
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: todos.length,
    );
  }
}