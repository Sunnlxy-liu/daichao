import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LootPage extends StatelessWidget {
  final GlobalKey<_LoadingWgtState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Web详情页"),
      // ),
      body: Container(
        child: Stack(
          children: [
            WebView(
              initialUrl: "http://www.liuxuyang.cc/index/loot/index",
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (index) {
                _key.currentState.refresh();
              },
            ),
            LoadingWgt(
              key: _key,
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingWgt extends StatefulWidget {
  LoadingWgt({Key key}) : super(key: key);
  @override
  _LoadingWgtState createState() => _LoadingWgtState();
}

class _LoadingWgtState extends State<LoadingWgt> {
  bool _loadComplate = false;
  @override
  Widget build(BuildContext context) {
    if (_loadComplate) {
      return SizedBox();
    }
    return Container(
      child: Center(
        child: Text(
          "网页加载中...",
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
      ),
    );
  }

  void refresh() {
    setState(() {
      _loadComplate = true;
    });
  }
}
