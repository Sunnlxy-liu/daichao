import 'package:daichao/blocs/mine/my_address_bloc.dart';
import 'package:daichao/common/bloc/base_state.dart';
import 'package:daichao/common/bloc/bloc_builder_wgt.dart';
import 'package:daichao/model/myaddress_model.dart';
import 'package:daichao/widgets/page_no_data_wgt.dart';
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
  MyAddressBloc myaddressbloc = MyAddressBloc();
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
          BlocConsumerWgt<MyAddressBloc>(
              bloc: myaddressbloc..add(GetMyAddressEvent()),
              listenIf: [SuccessMyAddressState, NoDataState],
              builder: (context, state) {
                if (state is NoDataState) {
                  return Center(
                    child: Container(
                      child: NoDataWgt(msg: state.msg),
                    ),
                  );
                }
                if (state is SuccessMyAddressState) {
                  return Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: 7,
                              ),
                              ListView.builder(
                                padding: EdgeInsets.all(0),
                                shrinkWrap: true, //范围内进行包裹（内容多高ListView就多高）
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: state.model.addressList.length,
                                itemBuilder: (context, index) {
                                  return _addressListItem(state.model.addressList[index]);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return Container();
              }),
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
                    NavigatorUtils.pushPage(
                        targPage: AddressDetailPage(),
                        dismissCallBack: (value) {
                          if (value != null) {
                            myaddressbloc.add(GetMyAddressEvent());
                          }
                        });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _addressListItem(AddressList address) {
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
                        address.name,
                        style: TextStyle(fontSize: 14, color: ColorsUtils.cl12, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 15),
                      Text(
                        address.mobile,
                        style: TextStyle(fontSize: 14, color: ColorsUtils.cl12, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      Offstage(
                        offstage: !(address.isDefault == 1 ? true : false),
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
                    address.country + address.province + address.city + address.area + address.address,
                    style: TextStyle(fontSize: 12, color: Color(0xFF8f96a3)),
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              NavigatorUtils.pushPage(
                  targPage: AddressDetailPage(
                    address: address,
                    title: '修改收货地址',
                  ),
                  dismissCallBack: (value) {
                    if (value != null) {
                      myaddressbloc.add(GetMyAddressEvent());
                    }
                  });
            },
            child: Container(
              alignment: Alignment.centerRight,
              width: 40,
              height: 40,
              child: Icon(
                IconData(0xe658, fontFamily: 'Appicon'),
                color: ColorsUtils.cl99,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
