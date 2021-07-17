import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// 加载中widget
class LoadingWgt extends StatelessWidget {
  final String msg;
  LoadingWgt({this.msg = "加载中..."});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitCircle(
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '$msg',
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
