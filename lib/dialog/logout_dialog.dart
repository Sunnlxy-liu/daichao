import 'package:flutter/material.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:flutter_screenutil/screen_util.dart';

class LogoutDialog extends StatelessWidget {
  double get _fontSize01 => ScreenUtil().setSp(13);
  Color get _cl54 => Color(0xFF54639A);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                '提示',
                style: TextStyle(fontSize: _fontSize01, color: ColorsUtils.cl20, fontWeight: FontWeight.w600),
              ),
              Container(
                height: 55,
                padding: EdgeInsets.all(14),
                child: Text('是否确认退出登录', style: TextStyle(fontSize: _fontSize01, color: ColorsUtils.cl20)),
              ),
              Container(
                decoration:
                    BoxDecoration(border: Border(top: BorderSide(color: ColorsUtils.lintSplitColor, width: 1.0))),
                height: 44,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text(
                        '取消',
                        style: TextStyle(fontSize: _fontSize01, color: ColorsUtils.cl20),
                      ),
                    ),
                    Container(
                      width: 1,
                      color: ColorsUtils.lintSplitColor,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text(
                        '确认',
                        style: TextStyle(fontSize: _fontSize01, color: _cl54),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
