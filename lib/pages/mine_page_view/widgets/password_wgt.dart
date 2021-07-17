import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:daichao/utils/form_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PassWordWgt extends StatefulWidget {
  PassWordWgt({
    this.onChange,
    this.contentStyle,
    this.hintStyle,
    this.hintText,
    this.textController,
  });

  final Function onChange;
  final TextStyle contentStyle;
  final TextStyle hintStyle;
  final String hintText;
  final TextEditingController textController;

  @override
  State<PassWordWgt> createState() => _PassWordWgtState();
}

class _PassWordWgtState extends State<PassWordWgt> {
  TextEditingController _controller = TextEditingController();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: FormUtils.inputBottomBorderDecoration,
      child: TextFormField(
        obscureText: !_showPassword,
        controller: widget.textController == null ? _controller : widget.textController,
        keyboardType: TextInputType.visiblePassword,
        inputFormatters: [LengthLimitingTextInputFormatter(16)],
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: widget.hintText ?? '密码6-16个字符',
          hintStyle: widget.hintStyle ?? TextStyle(fontSize: 13, color: ColorsUtils.cl99),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(
              IconData(!_showPassword ? 0xe606 : 0xe79c, fontFamily: "Appicon"),
              size: !_showPassword ? 15.sp : 17.sp,
              color: Colors.black54,
            ),
            onPressed: () {
              setState(() {
                _showPassword = !_showPassword;
              });
            },
          ),
        ),
        onChanged: widget.onChange,
      ),
    );
  }
}
