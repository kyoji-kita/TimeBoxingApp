import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class calendar_add extends StatelessWidget {
  calendar_add({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Todo add',
        theme: ThemeData(
        primarySwatch: Colors.teal,
        ),
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text('TodoList'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //"Push"で新規画面に遷移
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context){
                //遷移先の画面としてリスト追加画面に飛ばす
                return TodoAddPage();
              }),
          );
        },
      ),
    );
  }
}

class TodoAddPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト追加'),
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //テキスト入力
            TextField(),
            const SizedBox(height: 8),
            Container(
              //横幅いっぱいに広げる
              width: double.infinity,
              //リスト追加
              child: ElevatedButton(
                onPressed: () {  },
                child: Text('リスト追加', style: TextStyle(color: Colors.amber),),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('キャンセル'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}