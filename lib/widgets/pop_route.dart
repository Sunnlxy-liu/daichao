import 'package:flutter/material.dart';

class PopRoute extends PopupRoute{

  final Duration _duration = Duration(milliseconds: 100);
  Widget child;
  Color bgColor;

  PopRoute({@required this.child,this.bgColor});

  @override
  Color get barrierColor => bgColor;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;

}