import 'package:flutter/material.dart';

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
