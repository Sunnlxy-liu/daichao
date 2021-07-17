import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final double height;
  final Color backgroundColor;
  final bool centerTitle;
  final Widget leading;
  const AppBarWidget({
    Key key,
    this.titleText,
    this.height = kToolbarHeight,
    this.centerTitle = true,
    this.leading,
    this.backgroundColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      leading: leading,
      title: Text(
        "$titleText",
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
