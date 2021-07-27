import 'package:daichao/blocs/article/article_list_bloc.dart';
import 'package:daichao/common/bloc/bloc_builder_wgt.dart';
import 'package:daichao/model/article_list_model.dart';
import 'package:daichao/pages/main_page_view/widget/article_item_wgt.dart';
import 'package:flutter/material.dart';
import 'package:daichao/widgets/appbar_wgt.dart';

class ArticlePage extends StatelessWidget {
  final ArticleListBloc _articleListBloc = ArticleListBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(titleText: "资讯"),
        body: Container(
          child: SingleChildScrollView(
            child: BlocConsumerWgt<ArticleListBloc>(
              bloc: _articleListBloc..add(GetDataEvent('other ')),
              builder: (context, state) {
                if (state is SuccessDataState) {
                  return Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _hotArticleWgt(context, state.info.articleList),
                      _paddingBottomWgt(),
                    ],
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ),
        ));
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
        children: list.map((e) {
          return ArticleItemWgt(e);
        }).toList(),
      ),
    );
  }

  Widget _paddingBottomWgt() {
    return Container(height: 30);
  }
}
