import 'package:flutter/material.dart';
import 'todo.dart';

typedef ToggleTodoCallback = void Function(Todo);

class DoneList extends StatelessWidget{
  DoneList({@required this.dones, this.onTodoToggle});

  final List<Todo> dones;
  final ToggleTodoCallback onTodoToggle; //or this

  Widget _buildItem(BuildContext context, int index){
    final todo = dones[index];

    return ListTile(
      title: Text(todo.title),
      onLongPress: (){
        onTodoToggle(todo);
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: dones.length,
    );
  }

}