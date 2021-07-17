import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daichao/utils/colors_utils.dart';

class FormUtils {
  static BoxDecoration get inputBottomBorderDecoration => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorsUtils.lintSplitColor,
            width: 1.0,
          ),
        ),
      );

  static List<TextInputFormatter> get inputAuthCodeFormatter => [
        WhitelistingTextInputFormatter(RegExp("[0-9]")),
        LengthLimitingTextInputFormatter(6),
      ];

  static List<TextInputFormatter> get inputUsernameFormatter => [
        WhitelistingTextInputFormatter(RegExp("[a-zA-Z]|[\u4e00-\u9fa5]|[0-9]")),
        LengthLimitingTextInputFormatter(12),
      ];

  static List<TextInputFormatter> get inputIdCardFormatter => [
        WhitelistingTextInputFormatter(RegExp("[0-9]")),
        LengthLimitingTextInputFormatter(20),
      ];

  static List<TextInputFormatter> get inputPhoneFormatter => [
        WhitelistingTextInputFormatter(RegExp("[0-9]")),
        LengthLimitingTextInputFormatter(11),
        WhitelistingTextInputFormatter.digitsOnly,
        _PhoneNumberTextInputFormatter()
      ];
  static List<TextInputFormatter> get inputAmountFormatter => [
        // WhitelistingTextInputFormatter(RegExp("[0-9.]")),
        WhitelistingTextInputFormatter.digitsOnly,
      ];
  static List<TextInputFormatter> get inputAddressFormatter => [
        WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9]|[\u4e00-\u9fa5]")),
        LengthLimitingTextInputFormatter(120),
      ];

  static List<TextInputFormatter> get inputSuggetsFormatter => [
        WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9]|[\u4e00-\u9fa5]")),
        LengthLimitingTextInputFormatter(500),
      ];

  static bool isUsername(String phone) {
    String sTmp = phone.trim().replaceAll(' ', '');
    var regExp = RegExp('^[a-zA-Z]|[\u4e00-\u9fa5]|[0-9]\$');
    return regExp.hasMatch(sTmp);
  }

  static bool isAddress(String address) {
    String sTmp = address.trim().replaceAll(' ', '');
    var regExp = RegExp('^[a-zA-Z0-9]|[\u4e00-\u9fa5]{4}\$');
    return regExp.hasMatch(sTmp);
  }

  static bool isPhoneNumber(String phone) {
    String sTmp = phone.trim().replaceAll(' ', '');
    var regExp = RegExp('^1[3|4|5|6|7|8|9][0-9]{1}[0-9]{4}[0-9]{4}\$');
    return regExp.hasMatch(sTmp);
  }

  static bool isIdCardNumber(String phone) {
    String sTmp = phone.trim().replaceAll(' ', '');
    var regExp = RegExp('^1[3|4|5|6|7|8|9][0-9]{1}[0-9]{4}[0-9]{4}\$');
    return regExp.hasMatch(sTmp);
  }

  static bool isAmountNumber(String phone) {
    String sTmp = phone.trim().replaceAll(' ', '');
    var regExp = RegExp('^[0-9]{1}.{2}\$');
    return regExp.hasMatch(sTmp);
  }
}

class _PhoneNumberTextInputFormatter extends TextInputFormatter {
  _PhoneNumberTextInputFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();

    if (newTextLength >= 3) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ' ');
      if (newValue.selection.end >= 4) selectionIndex++;
    }

    if (newTextLength >= 7) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 7) + ' ');
      if (newValue.selection.end >= 8) selectionIndex++;
    }

    // Dump the rest.
    if (newTextLength >= usedSubstringIndex) newText.write(newValue.text.substring(usedSubstringIndex));
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
