import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:daichao/model/loan_list_model.dart';
import 'package:daichao/pages/loan_page_view/loan_detail_page.dart';
import 'package:daichao/utils/navigator_utils.dart';

class LoanItemWgt extends StatefulWidget {
  final LoanList data;
  LoanItemWgt(this.data);
  @override
  _LoanItemWgtState createState() => _LoanItemWgtState();
}

class _LoanItemWgtState extends State<LoanItemWgt> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 96,
        decoration: BoxDecoration(color: Colors.white),
        margin: EdgeInsets.only(bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 47,
              height: 47,
              margin: EdgeInsets.only(
                left: 17,
                right: 17,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: widget.data.thumbImage,
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
            Expanded(
              child: Container(
                height: 99.5,
                margin: EdgeInsets.only(right: 17),
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
                            height: 62,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      widget.data.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF202020),
                                        height: 1.5,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 18,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(
                                        left: 6,
                                        right: 6,
                                      ),
                                      margin: EdgeInsets.only(top: 4),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 0.5,
                                          color: Theme.of(context).accentColor,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(11),
                                          bottomRight: Radius.circular(9),
                                          topRight: Radius.circular(9),
                                        ),
                                      ),
                                      child: Text(
                                        widget.data.tags,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Theme.of(context).accentColor,
                                          fontSize: 10,
                                          height: 1.5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Baseline(
                                      baseline: 20.0,
                                      baselineType: TextBaseline.alphabetic,
                                      child: Text(
                                        widget.data.maxamount.toString(),
                                        style: TextStyle(
                                          color: Theme.of(context).accentColor,
                                          fontSize: 20,
                                          fontFamily: "BebasNeueRegular",
                                          height: 1.5,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Baseline(
                                      baseline: 12.0,
                                      baselineType: TextBaseline.alphabetic,
                                      child: Text(
                                        "最高可借额度（元）",
                                        style: TextStyle(
                                          color: Color(0xFFB6B6B6),
                                          fontSize: 12,
                                          height: 1.2,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(children: tagsWgt(widget.data.keywords)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      //tap事件触发
      onTap: () {
        NavigatorUtils.pushPage(
          targPage: LoanDetailPage(widget.data.id),
        );
      },
    );
  }

  List<Widget> tagsWgt(String keywords) {
    List<String> keywordsList = [];
    List<Widget> keywordsWgt = [];
    if (keywords != '') {
      keywordsList = keywords.split(',').map((e) => e.toString()).toList();
    }
    keywordsList.forEach((value) {
      Widget wid = keyWordsItemWgt(value);
      keywordsWgt.add(wid);
    });
    return keywordsWgt;
  }

  Widget keyWordsItemWgt(String str) {
    return Container(
      height: 20,
      padding: EdgeInsets.only(left: 3, right: 3),
      margin: EdgeInsets.only(right: 15),
      color: Color(0xFFFDFAE9),
      child: Text(
        str,
        style: TextStyle(
          color: Color(0xFFB3B3B3),
          fontSize: 12,
        ),
      ),
    );
  }
}
