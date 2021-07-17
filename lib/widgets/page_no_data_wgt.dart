import 'package:flutter/material.dart';

/// 暂无数据Widget
class NoDataWgt extends StatelessWidget {
  final String msg;
  final Function onTap;
  NoDataWgt({this.msg = "暂无数据", this.onTap});
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
              child: Image.asset('assets/images/empty.jpg'),
            ),
            Text(
              "$msg",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
