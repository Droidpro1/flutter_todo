import 'package:flutter/material.dart';
import 'todo_list_screen.dart';
import 'done_list_screen.dart';
import 'todo.dart';


class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  int _selectedItemIndex=0;

  static List<Todo> todos = [];
  static List<Todo> dones = [];

  List<Widget> _screens = <Widget>[
    TodoListScreen(todos: todos, dones: dones),
    DoneListScreen(dones: dones, todos: todos),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Flutter Todo"),
      ),
      body: _screens.elementAt(_selectedItemIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text("In Progress"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_turned_in),
            title: Text("Finished"),
          ),
        ],
        currentIndex: _selectedItemIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}