import 'package:daichao/data/repository/user_repository.dart';
import 'package:daichao/pages/mine_page_view/login.dart';
import 'package:daichao/utils/navigator_utils.dart';
import 'package:flutter/material.dart';

class MainMenusWgt extends StatelessWidget {
  // 初始默认选中
  final int initialIndex;

  /// 选项组
  final List<TabMenu> tabs;

  /// icon和Text之间的间距
  final double iconMarginText;

  /// 选中时文字和图标的颜色
  final Color selectedTabColor;

  /// 未选中时文字和图标的颜色
  final Color unselectedTabColor;

  /// 文字的大小
  final double textSize;

  final double iconSize;

  /// tabs所在区域的背景色
  final Color backgroundColor;

  // TabBar所在位置的高度
  final double tabBarHeight;

  /// 是否支持滑动切换
  final bool isScrollable;

  /// PageView切换时是否显示移动动画（一般用于页面标签切换）
  final bool showAnimation;

  PageController pageController;

  MainMenusWgt({
    @required this.tabs,
    this.initialIndex = 0,
    this.backgroundColor,
    this.iconMarginText = 0.0,
    this.selectedTabColor,
    this.textSize = 13.0,
    this.iconSize = 26,
    this.unselectedTabColor = Colors.grey,
    this.tabBarHeight = 60,
    this.isScrollable = true,
    this.showAnimation = false,
    Key key,
  }) : super(key: key) {
    pageController = PageController(initialPage: this.initialIndex);
  }

  // 动态设置选中那个Tab
  void jumpToPage(int index) {
    pageController.jumpToPage(index.clamp(0, tabs.length));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: initialIndex,
      length: tabs.length,
      child: Scaffold(
        body: Builder(builder: (context) {
          return PageView(
            controller: pageController,
            onPageChanged: (index) {
              // 默认动画时长300毫秒
              DefaultTabController.of(context).animateTo(index, duration: Duration(milliseconds: 300));
            },
            children: tabs.map((e) => KeepAliveWgt(e.view)).toList(),
            physics: isScrollable ? null : NeverScrollableScrollPhysics(),
          );
        }),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 0.5, color: Colors.grey[300]),
            ),
            color: backgroundColor ?? Colors.white, // Color(0xfff5f5f5),
          ),
          // 高度自适应
          height: tabBarHeight,
          child: TabBar(
            indicator: const BoxDecoration(), // 去掉TabBar的下划线
            labelColor: selectedTabColor ?? Theme.of(context).primaryColor, // 选中时文字和图标颜色
            unselectedLabelColor: unselectedTabColor, // 未选中时的图标和文字颜色
            labelStyle: TextStyle(fontSize: textSize),
            tabs: tabs.map((e) {
              return Tab(
                icon: Icon(e.icon, size: iconSize),
                text: e.text,
                iconMargin: EdgeInsets.only(bottom: iconMarginText),
              );
            }).toList(),
            onTap: (index) {
              if (showAnimation) {
                // pageView切换时带左右移动的动画效果
                pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              } else {
                // 未登录去登陆
                if (index == 3 && !UserRespository().userModel.isLogin) {
                  NavigatorUtils.pushPage(
                    targPage: LoginPage(),
                  );
                }
                pageController.jumpToPage(index);
              }
            },
          ),
        ),
      ),
    );
  }
}

/// Tab选项
class TabMenu {
  final String text;
  final IconData icon;
  final Widget view;
  TabMenu({
    @required this.text,
    @required this.icon,
    @required this.view,
  });
}

/// 状态保持控件
class KeepAliveWgt extends StatefulWidget {
  final Widget child;
  KeepAliveWgt(this.child);
  @override
  _KeepAliveWgtState createState() => _KeepAliveWgtState();
}

class _KeepAliveWgtState extends State<KeepAliveWgt> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
