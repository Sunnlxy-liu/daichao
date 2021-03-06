import 'package:flutter/material.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImageSheetPage extends StatelessWidget {
  TextStyle get _textStyle => TextStyle(fontSize: 13, color: Color(0xFF202020));
  final ImagePicker _picker = ImagePicker();

  void _onSelectPicture(context) async {
    PickedFile img = await _picker.getImage(
      source: ImageSource.gallery,
    );
    if (img == null) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop();
      // NavigatorUtils.pushPage(context, CropImagePage(img)).then((value) {
      //   Navigator.of(context).pop(value);
      // });
    }
  }

  void _onCamera(context) {
    _picker
        .getImage(
      source: ImageSource.camera,
    )
        .then((value) {
      if (value == null) {
        Navigator.of(context).pop();
      } else {
        Navigator.of(context).pop();
        // NavigatorUtils.pushPage(context, CropImagePage(value)).then((value) {
        //   Navigator.of(context).pop(value);
        // });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 138,
      child: Column(children: <Widget>[
        InkWell(
          child: Container(
            height: 44,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Text(
              '拍照',
              style: _textStyle,
            ),
          ),
          onTap: () {
            _onCamera(context);
          },
        ),
        Container(
          height: 1,
          color: ColorsUtils.lintSplitColor,
        ),
        InkWell(
          child: Container(
            height: 44,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Text(
              '从手机相册选择',
              style: _textStyle,
            ),
          ),
          onTap: () {
            _onSelectPicture(context);
          },
        ),
        Container(
          height: 5,
          color: ColorsUtils.lintSplitColor,
        ),
        InkWell(
          child: Container(
            height: 44,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Text(
              '取消',
              style: _textStyle,
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ]),
    );
  }
}
