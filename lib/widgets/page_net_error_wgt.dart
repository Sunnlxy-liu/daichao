import 'package:flutter/material.dart';

/// 网络异常Widget
class NetErrorWgt extends StatelessWidget {
  final Function onTap;
  NetErrorWgt({this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: InkWell(
          onTap: () => onTap(), // 触发重新加载
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150,
                child: Image.asset('assets/images/nonet.png'),
              ),
              Text(
                "网络异常，点击可重新加载",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ));
  }
}
