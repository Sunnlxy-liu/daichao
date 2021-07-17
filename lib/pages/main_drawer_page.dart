import 'package:flutter/material.dart';

class MainDrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[200],
      child: Center(
        child: Text(
          "侧边栏",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
    );
  }
}
