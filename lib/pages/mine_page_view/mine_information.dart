import 'package:cached_network_image/cached_network_image.dart';
import 'package:daichao/data/repository/user_repository.dart';
import 'package:daichao/pages/mine_page_view/widgets/img_sheet_page.dart';
import 'package:daichao/utils/image_utils.dart';
import 'package:daichao/utils/toast_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:flutter_pickers/more_pickers/init_data.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/default_style.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:flutter_pickers/time_picker/model/suffix.dart';
import 'package:http_parser/http_parser.dart';
import 'package:oktoast/oktoast.dart';

class MineInformationPage extends StatefulWidget {
  const MineInformationPage({Key key}) : super(key: key);

  @override
  _MineInformationPageState createState() => _MineInformationPageState();
}

class _MineInformationPageState extends State<MineInformationPage> {
  ToastFuture _closeFunc;
  List DataSex = ['男', '女'];
  String selectSex = '女';
  String selectEdu;
  String selectConstellation;
  var selectData = {
    DateMode.YMD: '',
    DateMode.YM: '',
  };
  Map<int, List> userInfo = {
    0: ['昵称', '摩羯座'],
    1: ['性别', '男'],
    2: ['生日', '1990-01-01'],
    3: ['电话', '18012345678'],
  };

  Map<int, List> userInfo2 = {
    0: ['长居地', '西安'],
    1: ['学历', '本科'],
    2: ['毕业时间', '2019年6月'],
    3: ['开始工作时间', '2020年3月'],
    4: ['当前工作单位', '西安风云千寻信息科技有限公司'],
    5: ['用户职位', '执行经理'],
    6: ['当前月收入', '9000元'],
    7: ['邮箱', '183434234@163.com'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "个人信息",
          style: TextStyle(
            fontSize: 18,
            color: ColorsUtils.cl12,
          ),
        ),
        leading: BackButton(color: ColorsUtils.cl12),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      //
      body: SingleChildScrollView(
        child: Column(
          children: [
            _informationImage(context),
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                height: 55,
                alignment: Alignment.center,
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
                      '昵称',
                      style: TextStyle(fontSize: 15, color: Color(0xFF0d162b)),
                    ),
                    Spacer(),
                    Text(
                      'liuxuyang',
                      style: TextStyle(fontSize: 15, color: Color(0xFF878792)),
                    ),
                    SizedBox(width: 3),
                    Icon(
                      IconData(0xe638, fontFamily: "Appicon"),
                      color: Color(0xFF878792),
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _onClickItem(DataSex, selectSex);
              },
              child: Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                height: 55,
                alignment: Alignment.center,
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
                      '性别',
                      style: TextStyle(fontSize: 15, color: Color(0xFF0d162b)),
                    ),
                    Spacer(),
                    Text(
                      selectSex,
                      style: TextStyle(fontSize: 15, color: Color(0xFF878792)),
                    ),
                    SizedBox(width: 3),
                    Icon(
                      IconData(0xe638, fontFamily: "Appicon"),
                      color: Color(0xFF878792),
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true, //范围内进行包裹（内容多高ListView就多高）
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _informationItem(userInfo[index]);
                },
              ),
            ),
            Container(
              height: 10,
              color: ColorsUtils.pageBcakgroundColor,
            ),
            Container(
              color: Colors.white,
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true, //范围内进行包裹（内容多高ListView就多高）
                physics: NeverScrollableScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return _informationItem(userInfo2[index]);
                },
              ),
            ),
            Container(
              height: 50,
              color: ColorsUtils.pageBcakgroundColor,
            ),
            Offstage(
              offstage: true,
              child: Container(
                padding: EdgeInsets.only(top: 20, bottom: 20, left: 25, right: 25),
                alignment: Alignment.center,
                color: Colors.white,
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
                      style: TextStyle(fontSize: 14),
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.5)),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            _logoutBtnWgt(context),
            Container(
              height: 100,
              color: ColorsUtils.pageBcakgroundColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _informationImage(context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Color(0xFFE6E6E6),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "头像",
              style: TextStyle(fontSize: 15, color: Color(0xFF0d162b)),
            ),
            _userImgeWgt(context),
          ],
        ),
      ),
    );
  }

  Widget _informationItem(List info) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        height: 55,
        alignment: Alignment.center,
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
              info[0],
              style: TextStyle(fontSize: 15, color: Color(0xFF0d162b)),
            ),
            Spacer(),
            Text(
              info[1],
              style: TextStyle(fontSize: 15, color: Color(0xFF878792)),
            ),
            SizedBox(width: 3),
            Icon(
              IconData(0xe638, fontFamily: "Appicon"),
              color: Color(0xFF878792),
              size: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget _userImgeWgt(context) {
    return InkWell(
      onTap: () {
        _onSetUserPhoto(context);
      },
      child: Container(
        width: 62,
        height: 62,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: Colors.white,
          ),
        ),
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: "http://liuxuyang.cc/assets/img/headicon.png",
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
    );
  }

  Widget _logoutBtnWgt(context) {
    return Offstage(
      offstage: !UserRespository().userModel.isLogin,
      child: InkWell(
        onTap: () async {
          UserRespository().logout();
          ToastUtils.showToastMsg("已退出登录");
          // var bRet = await Utils.showDialog(context, dialog: LogoutDialog());
          // if (bRet != true) {
          //   return;
          // }
          // UserRespository().logout().then((value) {
          //   if (value) {
          //     Navigator.of(context).pop();
          //   }
          // });
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 12, left: 24, right: 24, bottom: 12),
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
                color: Theme.of(context).accentColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Text(
            "退出登录",
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }

  void _onSetUserPhoto(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ImageSheetPage();
      },
    ).then((value) async {
      if (value == null) {
        return;
      }

      _closeFunc = ToastUtils.showLoadingToast(msg: '');
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

        // BlocProvider.of<MineSettingBloc>(context).add(
        //   ModifyUserAvatarEvent(avatar: multipartFile),
        // );
      } catch (e) {
        // Utils.debugInfo(e.toString());
        ToastUtils.closeAllToast();
      }
    });
  }

  void _onClickItem(var data, var selectData, {String label}) {
    Pickers.showSinglePicker(
      context,
      data: data,
      selectData: selectData,
      pickerStyle: DefaultPickerStyle(),
      // suffix: label,
      onConfirm: (p, position) {
        print('longer >>> 返回数据下标：$position');
        print('longer >>> 返回数据：$p');
        print('longer >>> 返回数据类型：${p.runtimeType}');
        setState(() {
          if (data == PickerDataType.sex) {
            selectSex = p;
          } else if (data == PickerDataType.education) {
            selectEdu = p;
          } else if (data == PickerDataType.constellation) {
            selectConstellation = p;
          }
        });
      },
    );
  }

  void _onDateClickItem(model) {
    Pickers.showDatePicker(
      context,
      mode: model,
      suffix: Suffix.normal(),

      // selectDate: PDuration(month: 2),
      minDate: PDuration(year: 2020, month: 2, day: 10),
      maxDate: PDuration(second: 22),

      // selectDate: PDuration(hour: 18, minute: 36, second: 36),
      // minDate: PDuration(hour: 12, minute: 38, second: 3),
      // maxDate: PDuration(hour: 12, minute: 40, second: 36),
      onConfirm: (p) {
        print('longer >>> 返回数据：$p');
        setState(() {
          switch (model) {
            case DateMode.YMD:
              selectData[model] = '${p.year}-${p.month}-${p.day}';
              break;
            case DateMode.YM:
              selectData[model] = '${p.year}-${p.month}';
              break;
          }
        });
      },
      // onChanged: (p) => print(p),
    );
  }
}
