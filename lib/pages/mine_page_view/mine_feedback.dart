import 'package:daichao/blocs/mine/suggest_bloc.dart';
import 'package:flutter/material.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:daichao/utils/form_utils.dart';

class MineFeedbackPage extends StatefulWidget {
  const MineFeedbackPage({Key key}) : super(key: key);

  @override
  _MineFeedbackPageState createState() => _MineFeedbackPageState();
}

class _MineFeedbackPageState extends State<MineFeedbackPage> {
  SuggestBloc suggestBloc = SuggestBloc();
  TextEditingController _suggestController = TextEditingController();
  bool _isSuggestValidated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "意见反馈",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 10),
            _suggestFormWgt("收货人"),
            Container(
              padding: EdgeInsets.all(25),
              alignment: Alignment.center,
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: RaisedButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Theme.of(context).accentColor,
                  child: Text(
                    "提交",
                    style: TextStyle(fontSize: 16, letterSpacing: 1),
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.5)),
                  onPressed: () {
                    suggestBloc.add(
                      AddSuggestEvent(
                        content: _suggestController.text.replaceAll(" ", ""),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _suggestFormWgt(String fieldName) {
    void _onSuggestChanged(String value) {
      setState(() {
        this._isSuggestValidated = FormUtils.isUsername(value);
      });
    }

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 40,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.5,
                  color: Color(0xFFE6E6E6),
                ),
              ),
            ),
            child: Row(
              children: [
                Text(
                  "您的建议",
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorsUtils.cl12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "（500字以内）",
                  style: TextStyle(
                    fontSize: 12,
                    color: ColorsUtils.cl99,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '请输入您的建议',
                hintStyle: TextStyle(fontSize: 13, color: ColorsUtils.cl99),
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 14, color: ColorsUtils.cl33),
              inputFormatters: FormUtils.inputSuggetsFormatter,
              keyboardType: TextInputType.multiline,
              maxLength: 500,
              keyboardAppearance: Brightness.light,
              controller: _suggestController,
              maxLines: 20,
              minLines: 1,
              onChanged: _onSuggestChanged,
            ),
          ),
        ],
      ),
    );
  }
}
