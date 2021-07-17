import 'package:flutter/material.dart';
import 'package:daichao/widgets/page_loading_wgt.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatelessWidget {
  final String title;
  final String url;

  final GlobalKey<_LoadingWgtState> _key = GlobalKey();

  WebPage({Key key, this.title = "web页面", @required this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
      ),
      body: Container(
        child: Stack(
          children: [
            WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (index) {
                _key.currentState?.refresh();
              },
            ),
            PageLoadingWgt(
              key: _key,
            ),
          ],
        ),
      ),
    );
  }
}

class PageLoadingWgt extends StatefulWidget {
  PageLoadingWgt({Key key}) : super(key: key);
  @override
  _LoadingWgtState createState() => _LoadingWgtState();
}

class _LoadingWgtState extends State<PageLoadingWgt> {
  double opacity = 1.0;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        child: Center(
          child: LoadingWgt(),
        ),
      ),
    );
  }

  void refresh() {
    setState(() {
      opacity = 0.0;
    });
  }
}
