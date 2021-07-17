import 'package:flutter/material.dart';
import 'package:daichao/pages/mine_page_view/address_detail.dart';
import 'package:daichao/utils/colors_utils.dart';
import 'package:daichao/utils/navigator_utils.dart';

class AddressListPage extends StatefulWidget {
  const AddressListPage({Key key}) : super(key: key);

  @override
  _AddressListPageState createState() => _AddressListPageState();
}

class _AddressListPageState extends State<AddressListPage> {
  GlobalKey<FormState> addressListKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "收货地址管理",
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
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 7,
                      ),
                      _addressListItem('刘徐阳', '15009291976', "陕西省 咸阳市 秦都区 陈阳寨街道 林凯城9号楼 陕西省 咸阳市 秦都区 陈阳寨街道 林凯城9号楼", true),
                      _addressListItem('马云', '13088888888', "浙江省 杭州市 余杭区 文一西路969号 淘宝城一期", false),
                      _addressListItem('马化腾', '13666666666', "广东省 深圳市 南山区 深南大道10000号", false),
                      _addressListItem(
                          '刘徐阳', '15009291976', "陕西省 咸阳市 秦都区 陈阳寨街道 林凯城9号楼 陕西省 咸阳市 秦都区 陈阳寨街道 林凯城9号楼", false),
                      _addressListItem('马云', '13088888888', "浙江省 杭州市 余杭区 文一西路969号 淘宝城一期", false),
                      _addressListItem('马化腾', '13666666666', "广东省 深圳市 南山区 深南大道10000号", false),
                      _addressListItem(
                          '刘徐阳', '15009291976', "陕西省 咸阳市 秦都区 陈阳寨街道 林凯城9号楼 陕西省 咸阳市 秦都区 陈阳寨街道 林凯城9号楼", false),
                      _addressListItem('马云', '13088888888', "浙江省 杭州市 余杭区 文一西路969号 淘宝城一期", false),
                      _addressListItem('马化腾', '13666666666', "广东省 深圳市 南山区 深南大道10000号", false),
                      _addressListItem(
                          '刘徐阳', '15009291976', "陕西省 咸阳市 秦都区 陈阳寨街道 林凯城9号楼 陕西省 咸阳市 秦都区 陈阳寨街道 林凯城9号楼", false),
                      _addressListItem('马云', '13088888888', "浙江省 杭州市 余杭区 文一西路969号 淘宝城一期", false),
                      _addressListItem('马化腾', '13666666666', "广东省 深圳市 南山区 深南大道10000号", false),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
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
                    "+新增收货地址",
                    style: TextStyle(fontSize: 16, letterSpacing: 1),
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.5)),
                  onPressed: () {
                    NavigatorUtils.pushPage(targPage: AddressDetailPage());
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _addressListItem(String name, String tel, String detailAddress, bool isInit) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Color(0xFFDFDFDF),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontSize: 14, color: ColorsUtils.cl12, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 15),
                      Text(
                        tel,
                        style: TextStyle(fontSize: 14, color: ColorsUtils.cl12, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      Offstage(
                        offstage: !isInit,
                        child: Container(
                          height: 16,
                          padding: EdgeInsets.only(left: 5, right: 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.red,
                          ),
                          child: Text(
                            "默认",
                            style: TextStyle(fontSize: 11, color: Colors.white, height: 1.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    detailAddress,
                    style: TextStyle(fontSize: 12, color: Color(0xFF8f96a3)),
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            width: 40,
            height: 40,
            child: Icon(
              IconData(0xe658, fontFamily: 'Appicon'),
              color: ColorsUtils.cl99,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
