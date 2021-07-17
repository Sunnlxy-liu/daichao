import 'package:flutter/material.dart';

/// 请求异常Widget（网络状态正常）
class ServerErrorWgt extends StatelessWidget {
  final Function onTap;
  ServerErrorWgt({this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: InkWell(
        onTap: () => onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 150,
              child: Image.asset('assets/images/errorserver.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              "加载失败，点击可重新加载",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
