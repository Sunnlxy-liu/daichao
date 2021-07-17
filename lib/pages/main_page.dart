import 'package:flutter/material.dart';
import 'package:daichao/pages/main_drawer_page.dart';
import 'package:daichao/pages/main_screen_page.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

final GlobalKey<SliderMenuContainerState> mainDrawerKey = new GlobalKey<SliderMenuContainerState>();

// 包含主屏幕与侧边栏
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SliderMenuContainer(
        key: mainDrawerKey, // key，必须设置，在任意界面均可通过该key来控制侧边栏
        slideDirection: SlideDirection.LEFT_TO_RIGHT, // 控制侧边栏在左还是在右，默认在右
        shadowColor: Colors.red[100], // 阴影的颜色
        animationDuration: 200, // 打开/关闭 侧边栏的动画时间，单位为毫秒
        isDraggable: false, // 是否支持滑动打开侧边栏
        hasAppBar: false, // 是否显示自带的AppBar
        sliderMenuOpenSize: MediaQuery.of(context).size.width * 0.8, // 侧边栏的尺寸
        // 打开抽屉时显示的[Widget]
        sliderMenu: MainDrawerPage(),
        // 主屏幕
        sliderMain: MainScreenPage(),
      ),
    );
  }
}
