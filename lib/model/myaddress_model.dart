import 'dart:convert';
import 'package:daichao/model/base_model.dart';
import 'package:flutter/foundation.dart';

class MyAddressModel extends BaseModel {
  final List<AddressList> addressList;
  MyAddressModel({
    this.addressList,
  });

  MyAddressModel copyWith({
    List<AddressList> addressList,
  }) {
    return MyAddressModel(
      addressList: addressList ?? this.addressList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'addressList': addressList?.map((x) => x.toMap())?.toList(),
    };
  }

  MyAddressModel fromMap(Map<String, dynamic> map) {
    return MyAddressModel(
      addressList: List<AddressList>.from(map['addressList']?.map((x) => AddressList.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyAddressModel.fromJson(String source) => MyAddressModel().fromMap(json.decode(source));

  @override
  String toString() => 'MyAddressModel(addressList: $addressList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MyAddressModel && listEquals(other.addressList, addressList);
  }

  @override
  int get hashCode => addressList.hashCode;
}

class AddressList {
  final int id;
  final String name;
  final String mobile;
  final String address;
  final String country;
  final String province;
  final String city;
  final String area;
  final int isDefault;
  final int createtime;
  AddressList({
    this.id,
    this.name,
    this.mobile,
    this.address,
    this.country,
    this.province,
    this.city,
    this.area,
    this.isDefault,
    this.createtime,
  });

  AddressList copyWith({
    int id,
    String name,
    String mobile,
    String address,
    String country,
    String province,
    String city,
    String area,
    int isDefault,
    int createtime,
  }) {
    return AddressList(
      id: id ?? this.id,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      address: address ?? this.address,
      country: country ?? this.country,
      province: province ?? this.province,
      city: city ?? this.city,
      area: area ?? this.area,
      isDefault: isDefault ?? this.isDefault,
      createtime: createtime ?? this.createtime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'mobile': mobile,
      'address': address,
      'country': country,
      'province': province,
      'city': city,
      'area': area,
      'isDefault': isDefault,
      'createtime': createtime,
    };
  }

  factory AddressList.fromMap(Map<String, dynamic> map) {
    return AddressList(
      id: map['id']?.toInt(),
      name: map['name'],
      mobile: map['mobile'],
      address: map['address'],
      country: map['country'],
      province: map['province'],
      city: map['city'],
      area: map['area'],
      isDefault: map['isDefault']?.toInt(),
      createtime: map['createtime']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressList.fromJson(String source) => AddressList.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AddressList(id: $id, name: $name, mobile: $mobile, address: $address, country: $country, province: $province, city: $city, area: $area, isDefault: $isDefault, createtime: $createtime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddressList &&
        other.id == id &&
        other.name == name &&
        other.mobile == mobile &&
        other.address == address &&
        other.country == country &&
        other.province == province &&
        other.city == city &&
        other.area == area &&
        other.isDefault == isDefault &&
        other.createtime == createtime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        mobile.hashCode ^
        address.hashCode ^
        country.hashCode ^
        province.hashCode ^
        city.hashCode ^
        area.hashCode ^
        isDefault.hashCode ^
        createtime.hashCode;
  }
}
