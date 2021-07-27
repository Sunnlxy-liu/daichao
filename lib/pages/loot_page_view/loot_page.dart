import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:collection';
// import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class LootPage extends StatefulWidget {
  const LootPage({Key key}) : super(key: key);

  @override
  _LootPageState createState() => _LootPageState();
}

class _LootPageState extends State<LootPage> {
  final GlobalKey webViewKey = GlobalKey();
  // final GlobalKey _key = GlobalKey();

  InAppWebViewController webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );
  PullToRefreshController pullToRefreshController;
  String url = "http://www.liuxuyang.cc/index/loot/index";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Web详情页"),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse("http://www.liuxuyang.cc/index/loot/index")),
                initialUserScripts: UnmodifiableListView<UserScript>([]),
                initialOptions: options,
                pullToRefreshController: pullToRefreshController,
                onWebViewCreated: (controller) {
                  webViewController = controller;
                },
                onLoadStart: (controller, url) {
                  setState(() {
                    this.url = url.toString();
                    urlController.text = this.url;
                  });
                },
                androidOnPermissionRequest: (controller, origin, resources) async {
                  return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
                },
                shouldOverrideUrlLoading: (controller, navigationAction) async {
                  var uri = navigationAction.request.url;

                  if (!["http", "https", "file", "chrome", "data", "javascript", "about"].contains(uri.scheme)) {
                    if (await canLaunch(url)) {
                      // Launch the App
                      await launch(
                        url,
                      );
                      // and cancel the request
                      return NavigationActionPolicy.CANCEL;
                    }
                  }

                  return NavigationActionPolicy.ALLOW;
                },
                onLoadStop: (controller, url) async {
                  pullToRefreshController.endRefreshing();
                  setState(() {
                    this.url = url.toString();
                    urlController.text = this.url;
                  });
                },
                onLoadError: (controller, url, code, message) {
                  pullToRefreshController.endRefreshing();
                },
                onProgressChanged: (controller, progress) {
                  if (progress == 100) {
                    pullToRefreshController.endRefreshing();
                  }
                  setState(() {
                    this.progress = progress / 100;
                    urlController.text = this.url;
                  });
                },
                onUpdateVisitedHistory: (controller, url, androidIsReload) {
                  setState(() {
                    this.url = url.toString();
                    urlController.text = this.url;
                  });
                },
                onConsoleMessage: (controller, consoleMessage) {
                  print(consoleMessage);
                },
              ),
            ),
            // progress < 1.0 ? LinearProgressIndicator(value: progress) : Container(),
            // WebView(
            //   initialUrl: "http://www.liuxuyang.cc/index/loot/index",
            //   javascriptMode: JavascriptMode.unrestricted,
            //   onPageFinished: (index) {
            //     // _key.currentState.refresh();
            //   },
            // ),
            // LoadingWgt(
            //   key: _key,
            // ),
          ],
        ),
      ),
    );
  }
}

// class LoadingWgt extends StatefulWidget {
//   LoadingWgt({Key key}) : super(key: key);
//   @override
//   _LoadingWgtState createState() => _LoadingWgtState();
// }

// class _LoadingWgtState extends State<LoadingWgt> {
//   bool _loadComplate = false;
//   @override
//   Widget build(BuildContext context) {
//     if (_loadComplate) {
//       return SizedBox();
//     }
//     return Container(
//       child: Center(
//         child: Text(
//           "网页加载中...",
//           style: TextStyle(fontSize: 20, color: Colors.red),
//         ),
//       ),
//     );
//   }

//   void refresh() {
//     setState(() {
//       _loadComplate = true;
//     });
//   }
// }
