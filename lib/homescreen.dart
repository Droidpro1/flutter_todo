import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    /*Since the app uses an AppBar, the Scaffold
    must be wrapped in this AnnotatedRegion widget*/
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Simple Flutter Todo"),
          ),
          body: _screens.elementAt(_selectedItemIndex),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
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
        )
    );
  }
}