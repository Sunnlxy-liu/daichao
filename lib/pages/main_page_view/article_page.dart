import 'package:flutter/material.dart';
import 'package:daichao/widgets/appbar_wgt.dart';

class ArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(titleText: "资讯"),
      body: Center(
        child: Text(
          "资讯",
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
