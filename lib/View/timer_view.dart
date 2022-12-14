import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class TimerView extends StatefulWidget{
  _TimerViewState createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView>{
  late Timer _timer; //この辺が状態
  late DateTime _time;

  @override
  void initState(){
    _time =DateTime.utc(0, 0, 0,);
    super.initState();
  }

@override
Widget build (BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat.Hms().format(_time),
            style: Theme.of(context).textTheme.headline2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(onPressed:(){ // Stopボタンタップ時の処理
                if (_timer != null && _timer.isActive) _timer.cancel();
              },
                child: Text("Stop"),
              ),
              FloatingActionButton(
                onPressed: () { // Startボタンタップ時の処理
                  _timer = Timer.periodic(
                    Duration(seconds: 1), // 1秒毎に定期実行
                        (Timer timer) {
                      setState(() { // 変更を画面に反映するため、setState()している
                        _time = _time.add(Duration(seconds: 1));
                      });
                    },
                  );
                },
                child: Text("Start"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}