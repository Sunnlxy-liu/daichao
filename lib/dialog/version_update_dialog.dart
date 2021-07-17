import 'dart:io';

import 'package:flutter/material.dart';
import 'package:daichao/data/data.dart';
import 'package:daichao/utils/toast_utils.dart';
import 'package:ota_update/ota_update.dart';

class VersionUpdateDialog extends StatelessWidget {
  // 更新描述示例
  final String modifyContent = "1、优化api接口。\r\n2、添加使用demo演示。\r\n3、新增自定义更新服务API接口。\r\n4、优化更新提示界面。";
  final String version; // 版本号
  final String desc; // 更新描述
  final String url; // 下载apk的url
  final int isForce; // 是否是强制升级（0：非强制   1：强制）
  VersionUpdateDialog({@required this.version, @required this.desc, @required this.url, this.isForce = 1});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Center(
        child: new Material(
          ///背景透明
          color: Colors.transparent,
          child: Column(
            children: <Widget>[
              Expanded(child: Container()),
              _dialog(context),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: 0.5,
                      color: Colors.white,
                    ),
                    Container(
                      height: 32,
                      child: Visibility(
                        visible: isForce == 0, // 非强制式显示关闭按钮
                        child: GestureDetector(
                          onTap: () {
                            // 点击关闭的时候记录当前关闭的时间以及本次忽略的版本号
                            // SpUtil.putString("app_server_version", version);
                            // SpUtil.putInt("time_up", DateTime.now().millisecondsSinceEpoch);
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            "assets/images/renzhengclose.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dialog(BuildContext context) {
    return new Center(
      ///弹框大小
      child: new Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: 370,
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(7.0),
          ),
          child: Container(
            ///弹框背景和圆角
            color: Theme.of(context).primaryColor,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage("assets/images/versionbg.png"),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "发现新版本!!!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "v$version 稳定版",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 20, right: 30),
                            child: Column(children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "更新内容：",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: SingleChildScrollView(
                                    child: Text(
                                      "$modifyContent",
                                      style: TextStyle(fontSize: 16, height: 1.5),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            _updateVersion();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                            height: 40,
                            child: Text("立即更新", style: TextStyle(color: Colors.white, fontSize: 17)),
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateVersion() async {
    if (Platform.isIOS) {
      navigatorKey.currentState.pop();
      ToastUtils.showToastMsg("ios跳转到App Store");
      // if (await canLaunch(url)) {
      //   await launch(url);
      // } else {
      //   // BotToast.showText(text: "下载地址无效");
      // }
    } else if (Platform.isAndroid) {
      try {
        OtaUpdate()
            // destinationFilename 是对下载的apk进行重命名
            .execute(url, destinationFilename: 'qiuban$version.apk')
            .listen(
          (OtaEvent event) {
            switch (event.status) {
              case OtaStatus.DOWNLOADING: // 正在下载中
                print('下载进度:${event.value}');
                break;
              case OtaStatus.INSTALLING: // 正在安装中
                print('正在安装中');
                break;
              case OtaStatus.PERMISSION_NOT_GRANTED_ERROR: // 当用户拒绝授予必需的权限时发送
                print('权限异常');
                break;
              case OtaStatus.DOWNLOAD_ERROR: // 下载失败
                print('下载失败');
                break;
              default: // 其他问题
                break;
            }
          },
        );
        // BotToast.showText(text: "开始在后台下载..");
      } catch (e) {
        // BotToast.showText(text: "更新失败，请稍后再试");
      }
    }
  }
}
