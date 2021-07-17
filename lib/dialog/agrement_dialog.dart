import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:daichao/common/web_page.dart';
import 'package:daichao/utils/navigator_utils.dart';

class AgreementDialog extends StatelessWidget {
  final double widthScale; // 屏幕宽度百分比,默认为80%
  AgreementDialog({this.widthScale = 0.8});
  // 协议说明文案
  final String userPrivateProtocol =
      "我们一向尊重并会严格保护用户在使用本产品时的合法权益（包括用户隐私、用户数据等）不受到任何侵犯。本协议（包括本文最后部分的隐私政策）是用户（包括通过各种合法途径获取到本产品的自然人、法人或其他组织机构，以下简称“用户”或“您”）与我们之间针对本产品相关事项最终的、完整的且排他的协议，并取代、合并之前的当事人之间关于上述事项的讨论和协议。本协议将对用户使用本产品的行为产生法律约束力，您已承诺和保证有权利和能力订立本协议。用户开始使用本产品将视为已经接受本协议，请认真阅读并理解本协议中各种条款，包括免除和限制我们的免责条款和对用户的权利限制（未成年人审阅时应由法定监护人陪同），如果您不能接受本协议中的全部条款，请勿开始使用本产品。";

  @override
  Widget build(BuildContext context) {
    return Material(
      //背景遮罩
      color: Colors.black45,
      //保证居中
      child: Center(child: _dialogUi(context)),
    );
  }

  Widget _dialogUi(context) {
    return Container(
      width: MediaQuery.of(context).size.width * widthScale.clamp(0.1, 1.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              '温馨提示',
              style: TextStyle(fontSize: 18, color: Color(0xff202020)),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: _contentUi(context),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xFFF5F5F5),
                  width: 1.0,
                ),
              ),
            ),
            height: 46,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      exit(0);
                    },
                    child: Text(
                      '不同意',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Color(0xff202020)),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  color: Color(0xFFF5F5F5),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      '同意',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _contentUi(context) {
    return RichText(
      text: TextSpan(
          text: "请您在使用本产品之前仔细阅读",
          style: TextStyle(fontSize: 15, height: 1.5, color: Colors.grey[600]),
          children: [
            TextSpan(
              text: "《用户协议》",
              style: TextStyle(color: Theme.of(context).primaryColor),
              //点击事件
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // 跳转页面使用webview加载用户协议
                  // ....点击事件处理
                  NavigatorUtils.pushPage(
                    targPage: WebPage(url: "https://www.baidu.com/"),
                  );
                },
            ),
            TextSpan(
              text: "与",
              style: TextStyle(color: Colors.grey[600]),
            ),
            TextSpan(
              text: "《隐私协议》",
              style: TextStyle(color: Theme.of(context).primaryColor),
              //点击事件
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // 跳转页面使用webview加载隐私协议
                  // ....点击事件处理
                  NavigatorUtils.pushPage(
                    targPage: WebPage(url: "https://www.baidu.com/"),
                  );
                },
            ),
            TextSpan(
              text: userPrivateProtocol,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ]),
    );
  }
}
