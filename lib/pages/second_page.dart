import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data.dart
class _TestPageState extends State<TestPage> {
  //定义菜单按钮选项
  List<Icon> iconList = [
    Icon(Icons.add),
    Icon(Icons.save),
    Icon(Icons.share),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("抖动动画"),
        ),
        backgroundColor: Colors.white,

        ///填充布局
        body: Container(
          color: Colors.yellow,
        ),
      ),
    );
  }
}
