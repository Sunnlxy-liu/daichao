import 'package:flutter/material.dart';
import 'package:daichao/widgets/appbar_wgt.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(titleText: "分类"),
      body: Center(
        child: Text(
          "分类",
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
