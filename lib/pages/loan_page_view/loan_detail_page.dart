import 'package:cached_network_image/cached_network_image.dart';
import 'package:daichao/blocs/loan/loan_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:daichao/common/bloc/bloc_builder_wgt.dart';
import 'package:flutter_html/flutter_html.dart';

class LoanDetailPage extends StatefulWidget {
  final int id;
  LoanDetailPage(this.id);
  @override
  _LoanDetailPageState createState() => _LoanDetailPageState();
}

class _LoanDetailPageState extends State<LoanDetailPage> {
  LoanDetailBloc _loanDetailBloc = LoanDetailBloc();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        leading: BackButton(color: Color(0xFF202020)),
        elevation: 0.5,
        title: Text(
          "贷款申请",
          style: TextStyle(color: Color(0xFF202020), fontSize: 16),
        ),
      ),
      body: BlocConsumerWgt<LoanDetailBloc>(
        bloc: _loanDetailBloc..add(GetDataEvent(widget.id)),
        builder: (context, state) {
          if (state is SuccessDataState) {
            return Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _topLoanInfoWgt(state),
                            Container(
                              padding: EdgeInsets.only(
                                left: 16,
                                right: 16,
                                bottom: 100,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 36,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "申请条件",
                                      style: TextStyle(color: Color(0xFF202020), fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  _contentWgt(state.info.content),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  // alignment: Alignment.bottomCenter,
                  bottom: 0,
                  left: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, -1), //阴影xy轴偏移量
                          blurRadius: .5, //阴影模糊程度
                          spreadRadius: .5, //阴影扩散程度
                        ),
                      ],
                    ),
                    padding: EdgeInsets.only(
                      left: 35,
                      right: 35,
                      top: 17.5,
                      bottom: 17.5,
                    ),
                    child: RaisedButton(
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Theme.of(context).accentColor,
                      child: Text(
                        "立即申请",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.5)),
                      onPressed: () {
                        // ....
                      },
                    ),
                  ),
                ),
              ],
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  Widget _topLoanInfoWgt(SuccessDataState state) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).accentColor.withOpacity(0.1),
            offset: Offset(0.0, 2), //阴影xy轴偏移量
            blurRadius: 1, //阴影模糊程度
            spreadRadius: 1, //阴影扩散程度
          ),
        ],
      ),
      child: Column(
        children: [
          _topLoanDataWgt(state),
          _lineWgt(),
          Container(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            height: 130,
            color: Colors.white,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //横轴三个子widget
                childAspectRatio: 2.6, //宽高比为1时，子widget
              ),
              children: <Widget>[
                _infoItem("最高可借额度", state.info.textmaxamount, "万", Theme.of(context).accentColor),
                _infoItem("最多可借", state.info.loanMax, "月", Theme.of(context).accentColor),
                _infoItem("年化率", "7.12", '%', Color(0xFF666666)),
                _infoItem("最低万元年利息", state.info.interestYear, "元", Color(0xFF666666)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _topLoanDataWgt(SuccessDataState state) {
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 47,
            height: 47,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
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
          Expanded(
            child: Container(
              height: 80,
              margin: EdgeInsets.only(right: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 48,
                          child: Row(
                            children: [
                              Text(
                                state.info.name,
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
                                  state.info.tags,
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
                        ),
                      ),
                    ],
                  ),
                  Row(children: tagsWgt(state.info.keywords)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _lineWgt() {
    return Container(
      height: 10,
      color: Colors.white,
      child: Flex(
        children: List.generate(((MediaQuery.of(context).size.width - 48) / 7).floor(), (_) {
          return SizedBox(
            width: 4,
            height: 0.5,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.grey),
            ),
          );
        }),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.horizontal,
      ),
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

  //_infoItem("最多可借","24","月",Theme.of(context).accentColor)
  Widget _infoItem(String title, String number, String unit, Color color) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xFF8A8A8A),
                fontSize: 13,
              ),
            ),
          ),
          Container(
            height: 30,
            child: Row(
              children: [
                Text(
                  number,
                  style: TextStyle(
                    color: color,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    // fontFamily: "BebasNeueRegular",
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  unit,
                  style: TextStyle(
                    color: color,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _contentWgt(String str) {
    return Html(
      data: str,
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
}

class LoanSelectConditions extends StatefulWidget {
  final int index;
  final int currentIndex;
  final String selectStr;
  const LoanSelectConditions({Key key, this.index = 0, this.currentIndex = 0, this.selectStr}) : super(key: key);

  @override
  _LoanSelectConditionsState createState() => _LoanSelectConditionsState();
}

class _LoanSelectConditionsState extends State<LoanSelectConditions> {
  int _index;
  int _currentIndex;
  String _selectStr;

  @override
  void initState() {
    super.initState();
    _index = widget.index;
    _currentIndex = widget.currentIndex;
    _selectStr = widget.selectStr;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_index != _currentIndex) {
          setState(() {
            _currentIndex = _index;
            // str = list[index];
          });
        }
      },
      child: Container(
        padding: EdgeInsets.only(left: 12, right: 12),
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            width: 0.5,
            color: _currentIndex == _index ? Theme.of(context).primaryColor : Color(0xFFE5E5E5),
          ),
          color: _currentIndex == _index ? Colors.white : Color(0xfff5f5f5),
        ),
        child: Text(
          _selectStr,
          style: TextStyle(
            fontSize: 14,
            color: _currentIndex == _index ? Theme.of(context).primaryColor : Color(0xFF202020),
          ),
        ),
      ),
    );
  }
}
