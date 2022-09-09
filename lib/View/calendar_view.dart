import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test22/main.dart';

import 'calendar_add.dart';

class calendar_view extends StatelessWidget {
  calendar_view({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: Center(
        child:TextButton(
          child: Text('カレンダー'),
          onPressed: () { Navigator.of(context).push<Widget>(
            MaterialPageRoute(builder: (context){return calendar_add();
            },
            ),
          ); },
       ),
      ),
    );
  }
}