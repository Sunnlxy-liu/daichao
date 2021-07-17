import 'dart:io';
import 'package:daichao/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';

// ignore: must_be_immutable
class CropImagePage extends StatefulWidget {
  CropImagePage(this.image);
  File image;

  @override
  State<CropImagePage> createState() => _CropImagePageState();
}

class _CropImagePageState extends State<CropImagePage> {
  double baseLeft; //图片左上角的x坐标
  double baseTop; //图片左上角的y坐标
  double imageWidth; //图片宽度，缩放后会变化
  double imageScale = 1; //图片缩放比例
  Image imageView;
  final cropKey = GlobalKey<CropState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFF333333),
        child: Stack(children: <Widget>[
          Container(
            child: Crop.file(
              widget.image,
              key: cropKey,
              aspectRatio: 1.0,
              alwaysShowGrid: true,
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 24, right: 24),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 0.8,
                    color: ColorsUtils.cl99,
                  ),
                ),
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    '取消',
                    style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    _crop(widget.image);
                  },
                  child: Text(
                    '完成',
                    style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ]),
            ),
          )
        ]),
      ),
    );
  }

  Future<void> _crop(File originalFile) async {
    final crop = cropKey.currentState;
    final area = crop.area;
    if (area == null) {
      //裁剪结果为空
      print('裁剪不成功');
    }
    bool bRet = await ImageCrop.requestPermissions();
    if (bRet) {
      ImageCrop.cropImage(
        file: originalFile,
        area: crop.area,
      ).then((value) {
        Navigator.of(context).pop(value);
      }).catchError((e) {
        Navigator.of(context).pop();
      });
    } else {
      Navigator.of(context).pop(originalFile);
    }
  }
}
