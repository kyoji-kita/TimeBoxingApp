import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test22/View/calendar_add.dart';
import 'package:test22/View/timer_view.dart';

import 'View/calendar_view.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({Key? key}):super(key: key);

 @override
 _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MyApp>{
  int _currentIndex = 0;
  final items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today),
      label:'カレンダー',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.timer),
      label:'タイマー',
    ),
  ];
  final tabs =<Widget>[
    calendar_add(),
    TimerView(),
  ];

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
      appBar: AppBar(
        title: Text('TimeBoxing'),
      ),
      body: Stack(
        children: <Widget>[
          IndexedStack(
            index: _currentIndex,
            children: tabs,
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigator(context),
    ),
    );
  }

  Widget _buildBottomNavigator(BuildContext context){
    return BottomNavigationBar(
        items: items,
      currentIndex: _currentIndex,
      onTap: (index){
          if (_currentIndex != index){
            setState(() {
              _currentIndex = index;
            });
          }
      },
    );
  }
}
