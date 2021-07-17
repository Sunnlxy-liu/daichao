import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:daichao/blocs/article/article_detail_bloc.dart';
import 'package:daichao/common/bloc/bloc_builder_wgt.dart';
import 'package:daichao/widgets/appbar_wgt.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailPage extends StatelessWidget {
  final int articleId;
  ArticleDetailPage(this.articleId);
  final ArticleDetailBloc articleDetailBloc = ArticleDetailBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(titleText: "资讯详情"),
      body: BlocConsumerWgt<ArticleDetailBloc>(
        bloc: articleDetailBloc..add(GetDataEvent(articleId)),
        builder: (context, state) {
          if (state is SuccessDataState) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        state.info.title,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF0d162b),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    _articleInfo(state),
                    SizedBox(
                      height: 12,
                    ),
                    _contentWgt(state),
                    SizedBox(
                      height: 24,
                    ),
                    _articleOfnextpre(state),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _articleInfo(SuccessDataState state) {
    return Container(
      child: Row(
        children: [
          SizedBox(width: 5),
          ClipOval(
            child: Container(
              width: 30,
              height: 30,
              child: CachedNetworkImage(
                imageUrl: state.info.thumbImage,
                placeholder: (context, url) => Image.asset(
                  "assets/images/ex1.jpg",
                  fit: BoxFit.cover,
                ),
                errorWidget: (context, url, error) => Image.asset(
                  "assets/images/ex1.jpg",
                  fit: BoxFit.cover,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Container(
            height: 30,
            alignment: Alignment.centerLeft,
            child: Text(
              state.info.author,
              style: TextStyle(color: Color(0xFF8f96a3), fontSize: 12),
            ),
          ),
          SizedBox(width: 12),
          Container(
            height: 30,
            alignment: Alignment.centerLeft,
            child: Text(
              // Utils.stampTimeFormatYmd(state.model.data.articleDetail.createtime),
              "2019/02/03",
              style: TextStyle(color: Color(0xFF8f96a3), fontSize: 13, height: 1.5),
            ),
          ),
          SizedBox(width: 12),
          Container(
            height: 30,
            alignment: Alignment.centerLeft,
            child: Text(
              state.info.views.toString() + '阅读',
              style: TextStyle(color: Color(0xFF8f96a3), fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _contentWgt(SuccessDataState state) {
    // String data = paraseData(state.info.articlecontent);
    return
        // WebView(
        //   initialUrl: data,
        //   javascriptMode: JavascriptMode.unrestricted, // 支持JS
        // );
        Html(
      data: state.info.articlecontent,
      customRender: {
        "table": (context, child) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: (context.tree as TableLayoutElement).toWidget(context),
          );
        },
        "bird": (RenderContext context, Widget child) {
          return TextSpan(text: "鸟");
        },
        "flutter": (RenderContext context, Widget child) {
          return FlutterLogo(
            // style: (context.tree.element!.attributes['horizontal'] != null)
            //     ? FlutterLogoStyle.horizontal
            //     : FlutterLogoStyle.markOnly,
            textColor: context.style.color,
            size: context.style.fontSize.size * 5,
          );
        },
      },
      customImageRenders: {
        networkSourceMatcher(domains: ["flutter.dev"]): (context, attributes, element) {
          return FlutterLogo(size: 36);
        },
        networkSourceMatcher(domains: ["mydomain.com"]): networkImageRender(
          headers: {"Custom-Header": "some-value"},
          altWidget: (alt) => Text(alt ?? ""),
          loadingWidget: () => Text("Loading..."),
        ),
      },
      onImageError: (exception, stackTrace) {
        print(exception);
      },
      onCssParseError: (css, messages) {
        print("css that errored: $css");
        print("error messages:");
        return "";
      },
    );
  }

  Widget _articleOfnextpre(SuccessDataState state) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Container(
            height: 30,
            child: Row(
              children: [
                Text(
                  "上一篇：",
                  style: TextStyle(fontSize: 14, color: Color(0xFF8f96a3)),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "警惕今日有不法分子冒充小满金融实施诈骗",
                      style: TextStyle(fontSize: 14, color: Color(0xFF8f96a3)),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            child: Row(
              children: [
                Text(
                  "下一篇：",
                  style: TextStyle(fontSize: 14, color: Color(0xFF8f96a3)),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "警惕今日有不法分子冒充小满金融实施诈骗",
                      style: TextStyle(fontSize: 14, color: Color(0xFF8f96a3)),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String paraseData(String articlecontent) {
    String head = "<head>" +
        "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=no\"> " +
        "<style>img{max-width: 100%; width:100%; height:auto;}*{margin:0px;}</style>" +
        "</head>";
    String result = "<html>" + head + "<body style='padding:0 10px;'>" + articlecontent + "</body></html>";
    // 防止出现乱码
    String contentBase64 = 'data:text/html;charset=utf-8;base64,${base64Encode(const Utf8Encoder().convert(result))}';
    return contentBase64;
  }
}
