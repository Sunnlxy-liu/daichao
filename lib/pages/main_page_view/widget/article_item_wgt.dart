import 'package:cached_network_image/cached_network_image.dart';
import 'package:daichao/model/article_list_model.dart';
import 'package:flutter/material.dart';
import 'package:daichao/pages/main_page_view/article_detail_page.dart';
import 'package:daichao/utils/dateformat_utils.dart';
import 'package:daichao/utils/navigator_utils.dart';

class ArticleItemWgt extends StatefulWidget {
  final ArticleList article;
  ArticleItemWgt(this.article);
  @override
  _NewsItemWgtState createState() => _NewsItemWgtState();
}

class _NewsItemWgtState extends State<ArticleItemWgt> {
  @override
  Widget build(BuildContext context) {
    // String dataTimpe =
    // DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.fromMillisecondsSinceEpoch(widget.article.createtime));
    String date = DateFormatUtils.format(widget.article.createtime.toString());
    return GestureDetector(
      child: Container(
        // height: 100,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: 99.5,
                margin: EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.5,
                      color: Color(0xFFDFDFDF),
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 70,
                            padding: EdgeInsets.only(
                              top: 12,
                            ),
                            child: Text(
                              widget.article.title,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF202020),
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 20,
                          padding: EdgeInsets.only(left: 3, right: 3),
                          margin: EdgeInsets.only(right: 15),
                          child: Row(
                            children: [
                              Icon(
                                IconData(0xe714, fontFamily: "Appicon"),
                                color: Color(0xFF8E96A3),
                                size: 11,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                date,
                                style: TextStyle(
                                  color: Color(0xFFB3B3B3),
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 20,
                          padding: EdgeInsets.only(left: 3, right: 3),
                          child: Row(
                            children: [
                              Icon(
                                IconData(0xe6b0, fontFamily: "Appicon"),
                                color: Color(0xFF8E96A3),
                                size: 14,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                widget.article.views.toString() + "人",
                                style: TextStyle(
                                  color: Color(0xFFB3B3B3),
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 107,
              height: 63,
              margin: EdgeInsets.only(
                left: 17,
                right: 17,
                top: 17,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
                color: Colors.red,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                child: CachedNetworkImage(
                  imageUrl: widget.article.thumbImage,
                  placeholder: (context, url) => Image.asset(
                    "assets/images/card.jpg",
                    fit: BoxFit.cover,
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/images/card.jpg",
                    fit: BoxFit.cover,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      //tap事件触发
      onTap: () {
        NavigatorUtils.pushPage(
          targPage: ArticleDetailPage(widget.article.id),
        );
      },
    );
  }
}
