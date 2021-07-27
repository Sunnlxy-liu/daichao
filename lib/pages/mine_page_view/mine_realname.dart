import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:daichao/blocs/mine/upload_img_bloc.dart';
import 'package:daichao/common/bloc/bloc_builder_wgt.dart';
import 'package:daichao/common/net/net_api.dart';
import 'package:daichao/data/repository/user_repository.dart';
import 'package:daichao/model/upload_model.dart';
import 'package:daichao/model/user_info_model.dart';
import 'package:daichao/pages/mine_page_view/widgets/img_sheet_page.dart';
import 'package:daichao/utils/image_utils.dart';
import 'package:daichao/utils/toast_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:daichao/utils/form_utils.dart';
import 'package:daichao/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oktoast/oktoast.dart';
import 'package:http_parser/http_parser.dart';

class MineRealNamePage extends StatefulWidget {
  const MineRealNamePage({Key key}) : super(key: key);

  @override
  _MineRealNamePageState createState() => _MineRealNamePageState();
}

class _MineRealNamePageState extends State<MineRealNamePage> {
  TextEditingController _realNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _cardTypeController = TextEditingController();
  TextEditingController _cardNumberController = TextEditingController();
  bool _isRealNameValidated = false;
  bool _isPhoneNumberValidated = false;
  bool _isCardTypeValidated = false;
  bool _isCardNumberValidated = false;
  bool isRead = false;
  ToastFuture _closeFunc;
  File _image;
  final ImagePicker _picker = ImagePicker();

  String cardImgJustUploadUrl = '';
  String cardImgBackUploadUrl = '';
  UploadImgBloc uploadImgBloc;
  @override
  void initState() {
    super.initState();
    uploadImgBloc = UploadImgBloc();
    if (UserRespository().userModel.isLogin) {
      _realNameController = TextEditingController(text: UserRespository().userModel.userInfo.confirmeInfo.realName);
      _phoneNumberController = TextEditingController(text: UserRespository().userModel.userInfo.confirmeInfo.mobile);
      _cardTypeController = TextEditingController(text: UserRespository().userModel.userInfo.confirmeInfo.passporttype);
      _cardNumberController =
          TextEditingController(text: UserRespository().userModel.userInfo.confirmeInfo.passportnumber);
      cardImgJustUploadUrl = UserRespository().userModel.userInfo.confirmeInfo.cardImgJust;
      cardImgBackUploadUrl = UserRespository().userModel.userInfo.confirmeInfo.cardImgBack;
    }
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
          "实名认证",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.bottom - 160,
              margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  _cardInfoWgt(),
                  _lineWgt(40.0, true),
                  _cardPicture(context),
                  _lineWgt(40.0, false),
                  _schemeStatusWgt(),
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
                          "提交申请",
                          style: TextStyle(fontSize: 16, letterSpacing: 1),
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.5)),
                        onPressed: () async {
                          if (!_isRealNameValidated) {
                            ToastUtils.showToastMsg("请输入真实姓名");
                            return false;
                          }
                          if (!_isPhoneNumberValidated) {
                            ToastUtils.showToastMsg("请输入手机号码");
                            return false;
                          }
                          if (!_isRealNameValidated) {
                            ToastUtils.showToastMsg("请输入证件类型");
                            return false;
                          }
                          if (!_isRealNameValidated) {
                            ToastUtils.showToastMsg("请输入证件号码");
                            return false;
                          }
                          if (cardImgJustUploadUrl == '') {
                            ToastUtils.showToastMsg("请上传身份证正面照片");
                            return false;
                          }
                          if (cardImgBackUploadUrl == '') {
                            ToastUtils.showToastMsg("请上传身份证反面照片");
                            return false;
                          }
                          if (!isRead) {
                            ToastUtils.showToastMsg("请阅读勾选用户使用手册");
                            return false;
                          }
                          ToastUtils.showLoadingToast(msg: "提交中");
                          try {
                            UserInfoModel model = await NetApi.uptConfirInfo(
                              params: {
                                "real_name": _realNameController.text.replaceAll(" ", ""),
                                "mobile": _phoneNumberController.text.replaceAll(" ", ""),
                                'passporttype': _cardTypeController.text.replaceAll("", ""),
                                "passportnumber": _cardNumberController.text.replaceAll("", ""),
                                "card_img_just": cardImgJustUploadUrl,
                                "card_img_back": cardImgBackUploadUrl,
                              },
                            );
                            // UserRespository().doLogin(model);
                            ToastUtils.showToastMsg("提交成功");
                          } catch (error) {
                            ToastUtils.showToastMsg("提交失败，请重试");
                          } finally {
                            // ToastUtils.closeAllToast();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // _suggestFormWgt("收货人"),
          ],
        ),
      ),
    );
  }

  Widget _cardInfoWgt() {
    return Container(
      color: Color(0xFFF7F7F7),
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          _realnameItem("真实姓名"),
          _phoneNumberItem("手机号"),
          _cardTypeItem("证件类型"),
          _cardNumberItem("证件号"),
        ],
      ),
    );
  }

  Widget _realnameItem(String fieldName) {
    void _onRealNameChanged(String value) {
      setState(() {
        this._isRealNameValidated = FormUtils.isUsername(value);
      });
    }

    return Container(
      height: 49,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.white,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            child: Text(
              fieldName,
              style: TextStyle(fontSize: 15, color: Color(0xFF8f96a3)),
            ),
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '请输入真实姓名',
                hintStyle: TextStyle(fontSize: 13, color: ColorsUtils.cl99),
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 14, color: ColorsUtils.cl33),
              inputFormatters: FormUtils.inputUsernameFormatter,
              keyboardType: TextInputType.text,
              keyboardAppearance: Brightness.light,
              controller: _realNameController,
              maxLines: 1,
              onChanged: _onRealNameChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget _phoneNumberItem(String fieldName) {
    void _onPhoneNumberChanged(String value) {
      setState(() {
        this._isPhoneNumberValidated = FormUtils.isPhoneNumber(value);
      });
    }

    return Container(
      height: 49,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.white,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            child: Text(
              fieldName,
              style: TextStyle(fontSize: 15, color: Color(0xFF8f96a3)),
            ),
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '请输入手机号码',
                hintStyle: TextStyle(fontSize: 13, color: ColorsUtils.cl99),
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 14, color: ColorsUtils.cl33),
              inputFormatters: FormUtils.inputPhoneFormatter,
              keyboardType: TextInputType.phone,
              keyboardAppearance: Brightness.light,
              controller: _phoneNumberController,
              maxLines: 1,
              onChanged: _onPhoneNumberChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardTypeItem(String fieldName) {
    void _onCardTypeChanged(String value) {
      setState(() {
        this._isCardTypeValidated = FormUtils.isUsername(value);
      });
    }

    return Container(
      height: 49,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.white,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            child: Text(
              fieldName,
              style: TextStyle(fontSize: 15, color: Color(0xFF8f96a3)),
            ),
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '请输入证件类型',
                hintStyle: TextStyle(fontSize: 13, color: ColorsUtils.cl99),
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 14, color: ColorsUtils.cl33),
              inputFormatters: FormUtils.inputUsernameFormatter,
              keyboardType: TextInputType.text,
              keyboardAppearance: Brightness.light,
              controller: _cardTypeController,
              maxLines: 1,
              onChanged: _onCardTypeChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardNumberItem(String fieldName) {
    void _onCardNumberChanged(String value) {
      setState(() {
        this._isCardNumberValidated = FormUtils.isUsername(value);
      });
    }

    return Container(
      height: 49,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.white,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            child: Text(
              fieldName,
              style: TextStyle(fontSize: 15, color: Color(0xFF8f96a3)),
            ),
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '请输入身份证号',
                hintStyle: TextStyle(fontSize: 13, color: ColorsUtils.cl99),
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 14, color: ColorsUtils.cl33),
              inputFormatters: FormUtils.inputUsernameFormatter,
              keyboardType: TextInputType.text,
              keyboardAppearance: Brightness.light,
              controller: _cardNumberController,
              maxLines: 1,
              onChanged: _onCardNumberChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget _lineWgt(double lineHeight, bool isShowRadius) {
    return Container(
      height: lineHeight,
      color: Colors.white,
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Offstage(
            offstage: !isShowRadius,
            child: Container(
              width: 7.5,
              height: 15,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(7.5),
                  bottomRight: Radius.circular(7.5),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 12, right: 12),
              height: 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage(Utils.getImage('dotted_line_6x1.png')),
                  repeat: ImageRepeat.repeatX,
                ),
              ),
            ),
          ),
          Offstage(
            offstage: !isShowRadius,
            child: Container(
              width: 7.5,
              height: 15,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7.5),
                  bottomLeft: Radius.circular(7.5),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _cardPicture(context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "上传身份照片",
              style: TextStyle(color: ColorsUtils.cl12, fontSize: 16),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Row(
              children: [
                cardJustItemWgt(uploadImgBloc, 'cardImgJust', 'card2.png'),
                cardBacktemWgt(uploadImgBloc, 'cardImgBack', 'card1.png'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget cardJustItemWgt(UploadImgBloc uploadImgBloc, String imgType, String backImg) {
    return Expanded(
      child: InkWell(
        onTap: () {
          _onUploadCardImg(context, imgType);
        },
        child: Container(
          margin: EdgeInsets.only(right: 8.75),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFE7EFFF),
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              BlocConsumerWgt<UploadImgBloc>(
                bloc: uploadImgBloc,
                listenIf: [UploadJustSuccessState, UploadFialedState],
                buildIf: [UploadJustSuccessState],
                builder: (context, state) {
                  if (state is UploadJustSuccessState) {
                    return Container(
                      height: 80,
                      width: 126,
                      child: CachedNetworkImage(
                        imageUrl: state.thumbImage,
                        placeholder: (context, url) => Image.asset(
                          Utils.getImage(backImg),
                          fit: BoxFit.cover,
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          Utils.getImage(backImg),
                          fit: BoxFit.cover,
                        ),
                        fit: BoxFit.cover,
                      ),
                    );
                  }
                  return showWhatInitCardImg(cardImgJustUploadUrl, backImg);
                },
              ),
              SizedBox(height: 10),
              Container(
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                ),
                child: Text(
                  "拍摄正面",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardBacktemWgt(UploadImgBloc uploadImgBloc, String imgType, String backImg) {
    return Expanded(
      child: InkWell(
        onTap: () {
          _onUploadCardImg(context, imgType);
        },
        child: Container(
          margin: EdgeInsets.only(left: 8.75),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFE7EFFF),
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              BlocConsumerWgt<UploadImgBloc>(
                bloc: uploadImgBloc,
                listenIf: [UploadBackSuccessState, UploadFialedState],
                buildIf: [UploadBackSuccessState],
                builder: (context, state) {
                  if (state is UploadBackSuccessState) {
                    return Container(
                      height: 80,
                      width: 126,
                      child: CachedNetworkImage(
                        imageUrl: state.thumbImage,
                        placeholder: (context, url) => Image.asset(
                          Utils.getImage(backImg),
                          fit: BoxFit.cover,
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          Utils.getImage(backImg),
                          fit: BoxFit.cover,
                        ),
                        fit: BoxFit.cover,
                      ),
                    );
                  }
                  return showWhatInitCardImg(cardImgBackUploadUrl, backImg);
                },
              ),
              SizedBox(height: 10),
              Container(
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                ),
                child: Text(
                  "拍摄反面",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showWhatInitCardImg(String urlImg, String backImg) {
    if (cardImgJustUploadUrl != '') {
      return Container(
        height: 80,
        width: 126,
        child: CachedNetworkImage(
          imageUrl: urlImg,
          placeholder: (context, url) => Image.asset(
            Utils.getImage(backImg),
            fit: BoxFit.cover,
          ),
          errorWidget: (context, url, error) => Image.asset(
            Utils.getImage(backImg),
            fit: BoxFit.cover,
          ),
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Container(
        height: 80,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.center,
            image: AssetImage(Utils.getImage(backImg)),
          ),
        ),
      );
    }
  }

  Widget _schemeStatusWgt() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      height: 20,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isRead = !isRead;
              });
            },
            child: Icon(
              IconData(0xe656, fontFamily: 'Appicon'),
              color: isRead ? Theme.of(context).accentColor : ColorsUtils.cl99,
              size: 12,
            ),
          ),
          SizedBox(width: 5),
          Text(
            "已阅读并同意",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF9d9d9d),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              "《贷超超市用户使用手册》",
              style: TextStyle(fontSize: 12, color: Theme.of(context).accentColor),
            ),
          )
        ],
      ),
    );
  }

  void _onUploadCardImg(context, String imgName) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ImageSheetPage();
      },
    ).then((value) async {
      if (value == null) {
        return;
      }

      _closeFunc = ToastUtils.showLoadingToast(msg: "上传中");
      try {
        //ByteData byteData = value.getByteData();
        List<int> imageData = await value.readAsBytes();
        //List<int> imageData = byteData.buffer.asUint8List();
        imageData = ImgUtils.imgCompress(data: imageData);
        MultipartFile multipartFile = MultipartFile.fromBytes(
          imageData,
          // 文件名
          filename: 'photo.jpg',
          // 文件类型 MediaType
          contentType: MediaType("image", "jpg"),
        );
        try {
          Dio dio = new Dio();
          Map<String, dynamic> map = Map();
          map["file"] = multipartFile;
          String netUploadUrl = "http://www.liuxuyang.cc/api/v1/User/uploadImage";
          FormData formData = FormData.fromMap(map);

          ///发送post
          Response response = await dio.post(
            netUploadUrl,
            options: Options(headers: {
              'token': UserRespository().userModel.token,
            }),
            data: formData,
          );
          var uploadData = response.data;
          if (uploadData != null && uploadData['code'] == 0) {
            ToastUtils.showToastMsg("上传成功");
            String uploadedUrl = uploadData['data']['fullurl'];
            if (imgName == 'cardImgJust') {
              cardImgJustUploadUrl = uploadData['data']['fullurl'];
            } else if (imgName == 'cardImgBack') {
              cardImgBackUploadUrl = uploadData['data']['fullurl'];
            }
            uploadImgBloc.add(UploadSuccessEvent(0, imgName, uploadedUrl));
          } else {
            ToastUtils.showToastMsg("上传失败");
          }
          // UploadModel model = await NetApi.upLoadImg(
          //   params: FormData.fromMap({"file": multipartFile}),

          // );
          // if (model.fullurl != null) {
          //   cardImgIustUploadUrl = model.fullurl;
          //   ToastUtils.showToastMsg("上传成功");
          // }
        } catch (error) {
          ToastUtils.showToastMsg("上传失败，请重试");
        } finally {
          ToastUtils.closeAllToast();
        }
      } catch (e) {
        // Utils.closeLoading(_closeFunc);
      }
    });
  }
}
