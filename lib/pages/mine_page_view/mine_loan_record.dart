import 'package:daichao/blocs/mine/loan_record_bloc.dart';
import 'package:daichao/common/bloc/base_state.dart';
import 'package:daichao/common/bloc/bloc_builder_wgt.dart';
import 'package:daichao/model/loan_record_model.dart';
import 'package:daichao/utils/utils.dart';
import 'package:daichao/widgets/page_no_data_wgt.dart';
import 'package:flutter/material.dart';
import 'package:daichao/utils/colors_utils.dart';

class MineLoanRecordPage extends StatefulWidget {
  @override
  _MineLoanRecordPageState createState() => _MineLoanRecordPageState();
}

class _MineLoanRecordPageState extends State<MineLoanRecordPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "贷款记录",
          style: TextStyle(
            fontSize: 18,
            color: ColorsUtils.cl12,
          ),
        ),
        leading: BackButton(color: ColorsUtils.cl12),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      backgroundColor: ColorsUtils.pageBcakgroundColor,
      body: BlocConsumerWgt<LoanRecordBloc>(
        bloc: LoanRecordBloc()..add(GetLoanRecordEvent()),
        listenIf: [SuccessLoanRecordState, NoDataState],
        builder: (context, state) {
          if (state is NoDataState) {
            return Center(
              child: Container(
                child: NoDataWgt(msg: state.msg),
              ),
            );
          }
          if (state is SuccessLoanRecordState) {
            return Column(
              children: [
                ListView.builder(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true, //范围内进行包裹（内容多高ListView就多高）
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.model.myloanList.length,
                  itemBuilder: (context, index) {
                    return _loanRecordItem(state.model.myloanList[index]);
                  },
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _loanRecordItem(MyloanList item) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 18, right: 18, top: 12, bottom: 12),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "贷款" + item.loan_amount.toString() + "元",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorsUtils.cl12,
                  ),
                ),
                Text(
                  item.approval_status, //  已还清3870ff  待还款29d355 已逾期ff3333
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF3870ff),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Text(
                  item.approval_status == '已审核'
                      ? Utils.stampTimeFormatYmd(item.createtime)
                      : Utils.stampTimeFormatYmd(item.createtime),
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF636363),
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "|",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF636363),
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "贷款",
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF636363),
                  ),
                )
              ],
            ),
            SizedBox(height: 3),
            Row(
              children: [
                Text(
                  "应还款日期",
                  style: TextStyle(
                    color: Color(0xFF9b9b9b),
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 6),
                Text(
                  Utils.stampTimeFormatYmd(item.repay_time),
                  style: TextStyle(
                    color: Color(0xFF9b9b9b),
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Text(
                  "应还款金额",
                  style: TextStyle(
                    color: Color(0xFF9b9b9b),
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 6),
                Text(
                  item.repay_amount.toString(),
                  style: TextStyle(
                    color: Color(0xFF9b9b9b),
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
