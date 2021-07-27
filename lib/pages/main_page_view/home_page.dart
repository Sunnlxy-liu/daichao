import 'package:cached_network_image/cached_network_image.dart';
import 'package:daichao/blocs/home/home_index_bloc.dart';
import 'package:daichao/data/repository/user_repository.dart';
import 'package:daichao/model/article_list_model.dart';
import 'package:daichao/model/banner_adver_model.dart';
import 'package:daichao/model/loan_list_model.dart';
import 'package:daichao/model/loan_type_model.dart';
import 'package:daichao/model/luck_users_model.dart';
import 'package:daichao/pages/loan_page_view/loan_page.dart';
import 'package:daichao/pages/loan_page_view/widgets/loan_item_wgt.dart';
import 'package:daichao/pages/loot_page_view/loot_page.dart';
import 'package:daichao/pages/main_page_view/article_page.dart';
import 'package:daichao/pages/mine_page_view/mine_information.dart';
import 'package:daichao/pages/mine_page_view/mine_realname.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:daichao/utils/navigator_utils.dart';
import 'package:flutter/material.dart';
import 'package:daichao/common/bloc/bloc_builder_wgt.dart';
import 'package:daichao/pages/main_page_view/widget/article_item_wgt.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  BannerAdverModel adverBannerModel;
  final HomeIndexBloc _homeIndexBloc = HomeIndexBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocConsumerWgt<HomeIndexBloc>(
          bloc: _homeIndexBloc..add(GetDataEvent()),
          builder: (context, state) {
            if (state is SuccessDataState) {
              return SingleChildScrollView(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _topBar(context),
                    _myCreditWgt(context),
                    _homeBannerWgt(context, state.homeBeen.adverList),
                    _fastMenuWgt(context, state.homeBeen.loanTypeList),
                    _resultWgt(context, state.homeBeen.userList),
                    _hotLoanListWgt(context, state.homeBeen.loanList),
                    _hotArticleWgt(context, state.homeBeen.articleList),
                    _paddingBottomWgt(),
                  ],
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget _topBar(context) {
    return Container(
      height: 224 + MediaQuery.of(context).padding.top + 5,
      child: Stack(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: 160,
              color: Theme.of(context).accentColor,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF127ADB),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 6,
                      left: 12,
                      right: 12,
                    ),
                    padding: EdgeInsets.only(
                      left: 22,
                      right: 10,
                    ),
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "1000-10000",
                          style: TextStyle(color: Colors.white38),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          child: Icon(
                            IconData(0xe644, fontFamily: "Appicon"),
                            color: Colors.white60,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 47, right: 17),
                    height: 30,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "张先生您好，您需要多少钱？",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              padding: EdgeInsets.only(
                left: 12,
                right: 12,
                top: 12,
                bottom: 12,
              ),
              margin: EdgeInsets.only(left: 12, right: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                // boxShadow: [
                //   BoxShadow(
                //     color: Color(0xFFF2F2F2),
                //     offset: Offset(0.0, 1.5), //阴影xy轴偏移量
                //     blurRadius: 0.5, //阴影模糊程度
                //     spreadRadius: 0.5, //阴影扩散程度
                //   ),
                // ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 62,
                        height: 62,
                        margin: EdgeInsets.only(
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                        ),
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: !UserRespository().userModel.isLogin
                                ? "http://liuxuyang.cc/assets/img/headicon.png"
                                : UserRespository().userModel.userInfo.avatar,
                            placeholder: (context, url) => Image.asset(
                              "assets/images/headicon.png",
                              fit: BoxFit.cover,
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              "assets/images/headicon.png",
                              fit: BoxFit.cover,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 28,
                                  child: Text(
                                    UserRespository().userModel.isLogin
                                        ? UserRespository().userModel.userInfo.nickname
                                        : '您还未登录',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: UserRespository().userModel.isLogin ? Colors.black : ColorsUtils.cl66,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Visibility(
                                  visible: UserRespository().userModel.isLogin,
                                  child: Container(
                                    width: 52,
                                    height: 18,
                                    padding: EdgeInsets.only(left: 3, right: 3),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(4)),
                                      border: Border.all(
                                        width: 0.5,
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          IconData(0xe656, fontFamily: "Appicon"),
                                          color: Theme.of(context).accentColor,
                                          size: 10,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "已实名",
                                          style: TextStyle(
                                              color: Theme.of(context).accentColor, fontSize: 10, height: 1.2),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 8,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 22,
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "资料完成度",
                                    style: TextStyle(
                                      color: Color(0xFF989898),
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 62,
                        width: 84,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                NavigatorUtils.pushPage(
                                  targPage: MineRealNamePage(),
                                );
                              },
                              child: Container(
                                height: 31,
                                child: Row(
                                  children: [
                                    Icon(
                                      IconData(0xe644, fontFamily: "Appicon"),
                                      color: Theme.of(context).accentColor,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "查看认证",
                                      style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                NavigatorUtils.pushPage(
                                  targPage: MineInformationPage(),
                                );
                              },
                              child: Container(
                                height: 31,
                                child: Row(
                                  children: [
                                    Icon(
                                      IconData(0xe8cf, fontFamily: "Appicon"),
                                      color: Theme.of(context).accentColor,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "完善资料",
                                      style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontSize: 11,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 72,
                      ),
                      Expanded(
                        child: Container(
                          height: 5,
                          decoration: BoxDecoration(
                            color: Color(0xFFE2E2E2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: LinearProgressIndicator(
                            //0~1的浮点数，用来表示进度多少;如果 value 为 null 或空，则显示一个动画，否则显示一个定值
                            value: UserRespository().userModel.isLogin &&
                                    UserRespository().userModel.userInfo.infoPercent != null
                                ? UserRespository().userModel.userInfo.infoPercent
                                : 0,
                            //背景颜色
                            backgroundColor: Color(0xFFE2E2E2),
                            //进度颜色
                            valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 94,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          NavigatorUtils.pushPage(
                            targPage: MineInformationPage(),
                          );
                        },
                        child: Container(
                          height: 30,
                          margin: EdgeInsets.only(top: 17),
                          padding: EdgeInsets.only(left: 9, right: 9),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                IconData(0xe796, fontFamily: "Appicon"),
                                color: Colors.white,
                                size: 10,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "查看资料",
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _homeBannerWgt(context, List<AdverList> list) {
    return Offstage(
      offstage: list.length == 0,
      child: Container(
        margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          child: AspectRatio(
            aspectRatio: 672 / 216, // 宽高比
            child: Swiper(
              onTap: (int index) {},
              itemBuilder: (BuildContext context, int index) {
                // InkWell组件为每一项设置点击事件监听
                return CachedNetworkImage(
                  imageUrl: list[index].coverImage,
                  placeholder: (context, url) => Image.asset(
                    "assets/images/default_image.png",
                    fit: BoxFit.cover,
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/images/default_image.png",
                    fit: BoxFit.cover,
                  ),
                  fit: BoxFit.cover,
                );
              },
              itemCount: list.length,
              autoplay: true,
              loop: true,
              pagination: new SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  // 指示器的大小和颜色
                  size: 5,
                  activeSize: 5,
                  color: Colors.black54,
                  activeColor: Colors.white,
                ),
              ), // 显示指示器，去掉就不显示
            ),
          ),
        ),
      ),
    );
  }

  Widget _myCreditWgt(context) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(
        left: 12,
        right: 12,
        top: 12,
      ),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 30,
                child: Text(
                  "我的信用",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF202020),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 32,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("信用评分")],
                      ),
                    ),
                    Container(
                      height: 32,
                      alignment: Alignment.center,
                      child: Text(
                        UserRespository().userModel.isLogin
                            ? UserRespository().userModel.userInfo.creditScore.toString()
                            : "--",
                        style: TextStyle(
                          color: Color(0xFFFF6600),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: "BebasNeueRegular",
                        ),
                      ),
                    ),
                    Container(
                      height: 32,
                      margin: EdgeInsets.only(bottom: 12),
                      child: OutlineButton(
                        child: Text(
                          '查看信用报告',
                          style: TextStyle(fontSize: 14),
                        ),
                        onPressed: () {},
                        textColor: Theme.of(context).accentColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        borderSide: BorderSide(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    Container(
                      height: 32,
                      child: RaisedButton(
                        // key: ,
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Theme.of(context).accentColor,
                        child: Text(
                          "更新信用报告",
                          style: TextStyle(fontSize: 14),
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 5,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(1.0)),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 32,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("信用积分")],
                      ),
                    ),
                    Container(
                      height: 32,
                      alignment: Alignment.center,
                      child: Text(
                        UserRespository().userModel.isLogin
                            ? UserRespository().userModel.userInfo.score.toString()
                            : "--",
                        style: TextStyle(
                          color: Color(0xFFFF6600),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: "BebasNeueRegular",
                        ),
                      ),
                    ),
                    Container(
                      height: 32,
                      margin: EdgeInsets.only(bottom: 12),
                      child: OutlineButton(
                        child: Text(
                          '赚积分',
                          style: TextStyle(fontSize: 14),
                        ),
                        onPressed: () {},
                        textColor: Theme.of(context).accentColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        borderSide: BorderSide(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    Container(
                      height: 32,
                      child: RaisedButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Theme.of(context).accentColor,
                        child: Text(
                          "积分兑换",
                          style: TextStyle(fontSize: 14),
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _fastMenuWgt(context, List<LoanTypeList> list) {
    return Container(
      // height: 120,
      margin: EdgeInsets.only(
        top: 12,
        left: 12,
        right: 12,
      ),
      padding: EdgeInsets.only(
        top: 22,
        bottom: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
      child: Row(
        children: list.map((e) {
          return _menuItem(
            context,
            e.name,
            e.thumbImage,
          );
        }).toList(),
      ),
    );
  }

  Widget _menuItem(context, String name, String imageUrl) {
    return Expanded(
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            width: 60,
            height: 60,
          ),
          Container(
            height: 30,
            alignment: Alignment.center,
            child: Text(
              name,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF202020),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _resultWgt(context, List<LucksList> list) {
    return Container(
      // height: 183,
      margin: EdgeInsets.only(left: 12, right: 12, top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          _titleOfModularWgt(context, "幸运用户", "去夺宝", LootPage()),
          Column(
            children: list.map((e) {
              return _luckUserItem(e);
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget _luckUserItem(LucksList model) {
    return Container(
      height: 45,
      padding: EdgeInsets.only(left: 12, right: 12),
      child: Row(
        children: [
          Container(
            width: 33,
            height: 33,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.only(right: 8),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: model.avatar,
                placeholder: (context, url) => Image.asset(
                  "assets/images/headicon.png",
                  fit: BoxFit.cover,
                ),
                errorWidget: (context, url, error) => Image.asset(
                  "assets/images/headicon.png",
                  fit: BoxFit.cover,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  height: 25,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${model.username}",
                    style: TextStyle(
                      color: Color(0xFF9a9a9a),
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Container(
                    height: 25,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${model.goodsname}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xFF6D6D6D),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 0, left: 10),
            child: Text(
              "${model.time}",
              style: TextStyle(color: Color(0xFF999999), fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _hotLoanListWgt(context, List<LoanList> list) {
    return Container(
      // height: 356,
      margin: EdgeInsets.only(left: 12, right: 12, top: 12),
      padding: EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          _titleOfModularWgt(context, "热门贷款", "更多", LoanPage()),
          Container(
            child: Column(children: [
              ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true, //范围内进行包裹（内容多高ListView就多高）
                physics: NeverScrollableScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return LoanItemWgt(list[index], isLast: index + 1 == list.length);
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _hotArticleWgt(context, List<ArticleList> list) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, top: 12),
      padding: EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _titleOfModularWgt(context, "热门资讯", "更多", ArticlePage()),
          Column(
            children: list.map((e) {
              return ArticleItemWgt(e);
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget _titleOfModularWgt(context, String title, String rightTitle, page) {
    return Container(
      height: 40,
      color: Colors.white,
      padding: EdgeInsets.only(
        left: 12,
        right: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF202020),
              fontWeight: FontWeight.w500,
            ),
          ),
          InkWell(
            onTap: () {
              NavigatorUtils.pushPage(
                targPage: page,
              );
            },
            child: Text(
              rightTitle,
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _paddingBottomWgt() {
    return Container(height: 30);
  }
}

class OvalBottomBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 24);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - size.width / 4,
      size.height,
      size.width,
      size.height - 24,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
