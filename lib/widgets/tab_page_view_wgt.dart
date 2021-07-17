import 'package:flutter/material.dart';

class TabPageViewWgt extends StatelessWidget {
  final int initialIndex; // 设置默认选中
  // 设置指示器距离底部的间距，用来调节指示器和文字的间距，默认距离底边0.0
  final double indicatorMarginBottom;
  final List<String> tabs; // 选项Tab（必须参数）
  final List<Widget> pages; // 对应的各个页面（可选）
  final bool pageIsScrollable; // pageview是否可滑动切换
  final bool tabIsScrollable; // Tab是否可滑动切换
  final double unselectTextSize; // 未选中文字的大小，不指定则同选中时的大小
  final double selectTextSize; // 选中时文字的大小
  final double tabHeight; // 设置TabBar的高度
  final Color selectedColor; // 选中时文字颜色
  final Color unselectedColor; // 未选中时文字的颜色，如果未选中的颜色不指定，将默认取选中颜色70%不透明度
  final bool showIndicator; // 是否显示指示器
  final Color tabBackgroundColor; // 设置TabBar的背景色
  final TabBarIndicatorSize indicatorSize; // 指示器宽度的2种模式：【tab,label】
  final double indicatorWidth; // 自定义指示器宽度，如果同时指定了indicatorSize，则会失效
  final double indicatorHeight; // 指示器高度
  final Color indicatorColor; // 设置指示器颜色
  final Function(int index) onTap; // TabBar的点击回(已进行同一Tab的重复点击处理)
  TabPageViewWgt({
    @required this.tabs,
    this.pages = const [],
    this.initialIndex = 0,
    this.indicatorMarginBottom = 0.0,
    this.pageIsScrollable = true,
    this.tabIsScrollable = false,
    this.selectTextSize = 13,
    this.unselectTextSize, // 如果未选中的大小不指定，将默认和选定时一致
    this.tabHeight,
    this.selectedColor = Colors.black,
    this.unselectedColor,
    this.showIndicator = true,
    this.tabBackgroundColor,
    this.indicatorSize,
    this.indicatorWidth = 30,
    this.indicatorHeight = 2.0,
    this.indicatorColor = Colors.red,
    this.onTap,
  }) {
    _pageController = PageController(initialPage: initialIndex);
    currentIndex = this.initialIndex;
  }

  PageController _pageController;
  int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: tabHeight,
            color: tabBackgroundColor,
            child: Theme(
              data: ThemeData(
                //点击的背景高亮颜色,处理阴影
                highlightColor: Colors.transparent,
                //点击水波纹颜色
                splashColor: Colors.transparent,
              ),
              child: TabBar(
                isScrollable: tabIsScrollable,
                indicatorPadding: EdgeInsets.only(top: 10),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: showIndicator
                    ? TabIndicatorWgt(
                        indicatorWidth: indicatorSize == null
                            ? -1
                            : indicatorWidth, // 设置indication的宽度,如果为-1则按照indicatorSize指定的
                        insets: EdgeInsets.only(
                            bottom: indicatorMarginBottom), // 两边间距，不设置默认为0
                        borderSide: BorderSide(
                          width: indicatorHeight,
                          color: indicatorColor,
                        ), // indicator的高度和颜色
                      )
                    : const BoxDecoration(),
                labelColor: selectedColor,
                unselectedLabelColor: unselectedColor,
                labelStyle: TextStyle(
                  fontSize: selectTextSize,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: unselectTextSize,
                ),
                tabs: tabs.map((e) {
                  return Tab(
                    text: e,
                  );
                }).toList(),
                onTap: (index) {
                  if (currentIndex != index) {
                    onTap?.call(index);
                    if (pages.length != 0) {
                      // pageView切换时带左右移动的动画效果
                      _pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                    currentIndex = index;
                  }
                },
              ),
            ),
          ),
          Visibility(
            visible: pages.length != 0,
            child: Expanded(
              child: Builder(builder: (context) {
                return PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    // 默认动画时长300毫秒
                    DefaultTabController.of(context).animateTo(index,
                        duration: Duration(milliseconds: 300));
                  },
                  children: pages.map((e) => KeepAliveWgt(e)).toList(),
                  physics:
                      pageIsScrollable ? null : NeverScrollableScrollPhysics(),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

/// 状态保持控件
class KeepAliveWgt extends StatefulWidget {
  final Widget child;
  KeepAliveWgt(this.child);
  @override
  _KeepAliveWgtState createState() => _KeepAliveWgtState();
}

class _KeepAliveWgtState extends State<KeepAliveWgt>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}

/// 自定义indicator组件
class TabIndicatorWgt extends Decoration {
  /// Create an underline style selected tab indicator.
  ///
  /// The [borderSide] and [insets] arguments must not be null.
  const TabIndicatorWgt({
    this.borderSide = const BorderSide(width: 2.0, color: Colors.white),
    this.insets = EdgeInsets.zero,
    this.indicatorWidth = -1,
  })  : assert(borderSide != null),
        assert(insets != null);

  /// The color and weight of the horizontal line drawn below the selected tab.
  final BorderSide borderSide;

  final double indicatorWidth;

  /// Locates the selected tab's underline relative to the tab's boundary.
  ///
  /// The [TabBar.indicatorSize] property can be used to define the
  /// tab indicator's bounds in terms of its (centered) tab widget with
  /// [TabIndicatorSize.label], or the entire tab with [TabIndicatorSize.tab].
  final EdgeInsetsGeometry insets;

  @override
  Decoration lerpFrom(Decoration a, double t) {
    if (a is UnderlineTabIndicator) {
      return TabIndicatorWgt(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t),
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration lerpTo(Decoration b, double t) {
    if (b is TabIndicatorWgt) {
      return TabIndicatorWgt(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t),
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  _MyUnderlinePainter createBoxPainter([VoidCallback onChanged]) {
    return _MyUnderlinePainter(this, indicatorWidth, onChanged);
  }
}

class _MyUnderlinePainter extends BoxPainter {
  _MyUnderlinePainter(this.decoration, this.indiWidth, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  final TabIndicatorWgt decoration;
  final double indiWidth;

  BorderSide get borderSide => decoration.borderSide;
  EdgeInsetsGeometry get insets => decoration.insets;

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(textDirection != null);
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);

    if (indiWidth == -1) {
      return Rect.fromLTWH(
        indicator.left,
        indicator.bottom - borderSide.width,
        indicator.width,
        borderSide.width,
      );
    } else {
      //取中间坐标
      double cw = (indicator.left + indicator.right) / 2;
      return Rect.fromLTWH(cw - indiWidth / 2,
          indicator.bottom - borderSide.width, indiWidth, borderSide.width);
    }
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size;
    final TextDirection textDirection = configuration.textDirection;
    final Rect indicator =
        _indicatorRectFor(rect, textDirection).deflate(borderSide.width / 2.0);
    final Paint paint = borderSide.toPaint()..strokeCap = StrokeCap.round;
    canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);
  }
}
