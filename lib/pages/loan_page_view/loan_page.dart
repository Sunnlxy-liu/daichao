import 'package:daichao/blocs/loan/loan_bloc.dart';
import 'package:daichao/common/bloc/base_state.dart';
import 'package:daichao/common/bloc/bloc_builder_wgt.dart';
import 'package:daichao/model/loan_list_model.dart';
import 'package:daichao/pages/loan_page_view/widgets/loan_item_wgt.dart';
import 'package:daichao/widgets/page_loading_wgt.dart';
import 'package:daichao/widgets/page_server_error_wgt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoanPage extends StatelessWidget {
  final LoanBloc loanBloc = LoanBloc();
  int typeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        title: Container(
          height: 36,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFF3F3F3),
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
          ),
          margin: EdgeInsets.only(
            // top: MediaQuery.of(context).padding.top + 6,
            left: 12,
            // right: 12,
          ),
          padding: EdgeInsets.only(
            left: 12,
            right: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                IconData(0xe644, fontFamily: "Appicon"),
                color: Color(0xFF8A8A8A),
                size: 18,
              ),
              Text(
                "您需要多少钱？",
                style: TextStyle(color: Color(0xFF8A8A8A), fontSize: 14),
              ),
            ],
          ),
        ),
        actions: [
          // Container(
          //   child: Icon(IconData(0xe644, fontFamily: "Appicon")),
          // ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(
                right: 22,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "综合",
                    style: TextStyle(color: Color(0xFF8A8A8A)),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    IconData(0xe633, fontFamily: "Appicon"),
                    color: Color(0xFF8A8A8A),
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: BlocConsumerWgt<LoanBloc>(
          bloc: loanBloc..add(GetDataEvent()),
          buildIf: [SuccessDataState, LoadingState, NetErrorState],
          builder: (context, state) {
            if (state is SuccessDataState) {
              return _successUi(state.items, state.lists, state.totalNum);
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget _successUi(List<TypeBeen> items, List<LoanList> lists, int num) {
    int totalNum = num;
    List<LoanList> list = lists;
    return Row(children: [
      SelectItem(items, loanBloc, (id) {
        typeId = id;
      }),
      Expanded(
        child: Container(
          child: BlocConsumerWgt<LoanBloc>(
            bloc: loanBloc,
            buildIf: [ItemLoadingState, ItemErrorState, SelectResultState],
            builder: (context, state) {
              if (state is ItemLoadingState) {
                return LoadingWgt();
              }
              if (state is ItemErrorState) {
                return ServerErrorWgt(
                  onTap: () {
                    // 重新加载
                    loanBloc.add(SelectItemEvent(typeId));
                  },
                );
              }
              if (state is SelectResultState) {
                totalNum = state.totalNum;
                list = state.lists;
              }
              return Column(
                children: [
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    color: Colors.white,
                    child: Text(
                      "共 $totalNum 个内容",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true, //范围内进行包裹（内容多高ListView就多高）
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return LoanItemWgt(list[index], isLast: index + 1 == list.length);
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    ]);
  }
}

class SelectItem extends StatefulWidget {
  final List<TypeBeen> items;
  final LoanBloc loanBloc;
  final Function(int) onTap;
  const SelectItem(this.items, this.loanBloc, this.onTap, {Key key}) : super(key: key);

  @override
  _SelectItemState createState() => _SelectItemState();
}

class _SelectItemState extends State<SelectItem> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      child: ListView(
        children: widget.items.asMap().keys.map((index) {
          return InkWell(
            onTap: () {
              widget.onTap(widget.items[index].id);
              setState(() {
                _index = index;
                // 发送分类选择事件
                widget.loanBloc.add(SelectItemEvent(widget.items[index].id));
              });
            },
            child: Container(
              height: 50,
              color: index == _index ? Colors.white : Colors.grey[100],
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Container(
                    width: 2,
                    height: 15,
                    decoration: BoxDecoration(
                      color: index == _index ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "${widget.items[index].name}",
                      style: TextStyle(
                        fontSize: 15,
                        color: index == _index ? Color(0xff202020) : Color(0xff666666),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
