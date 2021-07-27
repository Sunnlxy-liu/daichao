import 'dart:convert';

import 'package:daichao/model/base_model.dart';

class UserInfoModel extends BaseModel {
  final UserInfo userInfo;
  UserInfoModel({
    this.userInfo,
  });

  UserInfoModel copyWith({
    UserInfo userInfo,
  }) {
    return UserInfoModel(
      userInfo: userInfo ?? this.userInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userInfo': userInfo.toMap(),
    };
  }

  UserInfoModel fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      userInfo: UserInfo.fromMap(map['userInfo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfoModel.fromJson(String source) => UserInfoModel().fromMap(json.decode(source));

  @override
  String toString() => 'UserInfoModel(userInfo: $userInfo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserInfoModel && other.userInfo == userInfo;
  }

  @override
  int get hashCode => userInfo.hashCode;
}

class UserInfo {
  final int id;
  final String username;
  final String nickname;
  final String email;
  final String mobile;
  final String avatar;
  final int gender;
  final String birthday;
  final int score;
  final int prevtime;
  final double creditScore;
  final int loanCount;
  final String gradeNumber;
  final String token;
  final int user_id;
  final int createtime;
  final int expiretime;
  final int expiresIn;
  final String offenLive;
  final String education;
  final String graduationTime;
  final String startWorkTime;
  final String nowCompany;
  final String position;
  final String income;
  final ConfirmeInfo confirmeInfo;
  final double infoPercent;
  final String creditReport;
  UserInfo({
    this.id,
    this.username,
    this.nickname,
    this.email,
    this.mobile,
    this.avatar,
    this.gender,
    this.birthday,
    this.score,
    this.prevtime,
    this.creditScore,
    this.loanCount,
    this.gradeNumber,
    this.token,
    this.user_id,
    this.createtime,
    this.expiretime,
    this.expiresIn,
    this.offenLive,
    this.education,
    this.graduationTime,
    this.startWorkTime,
    this.nowCompany,
    this.position,
    this.income,
    this.confirmeInfo,
    this.infoPercent,
    this.creditReport,
  });

  UserInfo copyWith({
    int id,
    String username,
    String nickname,
    String email,
    String mobile,
    String avatar,
    int gender,
    String birthday,
    int score,
    int prevtime,
    double creditScore,
    int loanCount,
    String gradeNumber,
    String token,
    int user_id,
    int createtime,
    int expiretime,
    int expiresIn,
    String offenLive,
    String education,
    String graduationTime,
    String startWorkTime,
    String nowCompany,
    String position,
    String income,
    ConfirmeInfo confirmeInfo,
    double infoPercent,
    String creditReport,
  }) {
    return UserInfo(
      id: id ?? this.id,
      username: username ?? this.username,
      nickname: nickname ?? this.nickname,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      avatar: avatar ?? this.avatar,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      score: score ?? this.score,
      prevtime: prevtime ?? this.prevtime,
      creditScore: creditScore ?? this.creditScore,
      loanCount: loanCount ?? this.loanCount,
      gradeNumber: gradeNumber ?? this.gradeNumber,
      token: token ?? this.token,
      user_id: user_id ?? this.user_id,
      createtime: createtime ?? this.createtime,
      expiretime: expiretime ?? this.expiretime,
      expiresIn: expiresIn ?? this.expiresIn,
      offenLive: offenLive ?? this.offenLive,
      education: education ?? this.education,
      graduationTime: graduationTime ?? this.graduationTime,
      startWorkTime: startWorkTime ?? this.startWorkTime,
      nowCompany: nowCompany ?? this.nowCompany,
      position: position ?? this.position,
      income: income ?? this.income,
      confirmeInfo: confirmeInfo ?? this.confirmeInfo,
      infoPercent: infoPercent ?? this.infoPercent,
      creditReport: creditReport ?? this.creditReport,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'nickname': nickname,
      'email': email,
      'mobile': mobile,
      'avatar': avatar,
      'gender': gender,
      'birthday': birthday,
      'score': score,
      'prevtime': prevtime,
      'creditScore': creditScore,
      'loanCount': loanCount,
      'gradeNumber': gradeNumber,
      'token': token,
      'user_id': user_id,
      'createtime': createtime,
      'expiretime': expiretime,
      'expiresIn': expiresIn,
      'offenLive': offenLive,
      'education': education,
      'graduationTime': graduationTime,
      'startWorkTime': startWorkTime,
      'nowCompany': nowCompany,
      'position': position,
      'income': income,
      'confirmeInfo': confirmeInfo.toMap(),
      'infoPercent': infoPercent,
      'creditReport': creditReport,
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      id: map['id']?.toInt(),
      username: map['username'],
      nickname: map['nickname'],
      email: map['email'],
      mobile: map['mobile'],
      avatar: map['avatar'],
      gender: map['gender']?.toInt(),
      birthday: map['birthday'],
      score: map['score']?.toInt(),
      prevtime: map['prevtime']?.toInt(),
      loanCount: map['loanCount']?.toInt(),
      creditScore: map['creditScore']?.toDouble(),
      gradeNumber: map['gradeNumber'],
      token: map['token'],
      user_id: map['user_id']?.toInt(),
      createtime: map['createtime']?.toInt(),
      expiretime: map['expiretime']?.toInt(),
      expiresIn: map['expiresIn']?.toInt(),
      offenLive: map['offenLive'],
      education: map['education'],
      graduationTime: map['graduationTime'],
      startWorkTime: map['startWorkTime'],
      nowCompany: map['nowCompany'],
      position: map['position'],
      income: map['income'],
      confirmeInfo: ConfirmeInfo.fromMap(map['confirmeInfo']),
      infoPercent: map['infoPercent']?.toDouble(),
      creditReport: map['creditReport'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfo.fromJson(String source) => UserInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserInfo(id: $id, username: $username, nickname: $nickname, email: $email, mobile: $mobile, avatar: $avatar, gender: $gender, birthday: $birthday, score: $score, prevtime: $prevtime,creditScore: $creditScore, loanCount: $loanCount, gradeNumber: $gradeNumber, token: $token, user_id: $user_id, createtime: $createtime, expiretime: $expiretime, expiresIn: $expiresIn, offenLive: $offenLive, education: $education, graduationTime: $graduationTime, startWorkTime: $startWorkTime, nowCompany: $nowCompany, position: $position, income: $income, confirmeInfo: $confirmeInfo, infoPercent: $infoPercent, creditReport: $creditReport)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserInfo &&
        other.id == id &&
        other.username == username &&
        other.nickname == nickname &&
        other.email == email &&
        other.mobile == mobile &&
        other.avatar == avatar &&
        other.gender == gender &&
        other.birthday == birthday &&
        other.score == score &&
        other.prevtime == prevtime &&
        other.creditScore == creditScore &&
        other.loanCount == loanCount &&
        other.gradeNumber == gradeNumber &&
        other.token == token &&
        other.user_id == user_id &&
        other.createtime == createtime &&
        other.expiretime == expiretime &&
        other.expiresIn == expiresIn &&
        other.offenLive == offenLive &&
        other.education == education &&
        other.graduationTime == graduationTime &&
        other.startWorkTime == startWorkTime &&
        other.nowCompany == nowCompany &&
        other.position == position &&
        other.income == income &&
        other.confirmeInfo == confirmeInfo &&
        other.infoPercent == infoPercent &&
        other.creditReport == creditReport;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        nickname.hashCode ^
        email.hashCode ^
        mobile.hashCode ^
        avatar.hashCode ^
        gender.hashCode ^
        birthday.hashCode ^
        score.hashCode ^
        prevtime.hashCode ^
        creditScore.hashCode ^
        loanCount.hashCode ^
        gradeNumber.hashCode ^
        token.hashCode ^
        user_id.hashCode ^
        createtime.hashCode ^
        expiretime.hashCode ^
        expiresIn.hashCode ^
        offenLive.hashCode ^
        education.hashCode ^
        graduationTime.hashCode ^
        startWorkTime.hashCode ^
        nowCompany.hashCode ^
        position.hashCode ^
        income.hashCode ^
        confirmeInfo.hashCode ^
        infoPercent.hashCode ^
        creditReport.hashCode;
  }
}

class ConfirmeInfo {
  final String realName;
  final String mobile;
  final String passporttype;
  final String passportnumber;
  final String cardImgJust;
  final String cardImgBack;
  ConfirmeInfo({
    this.realName,
    this.mobile,
    this.passporttype,
    this.passportnumber,
    this.cardImgJust,
    this.cardImgBack,
  });

  ConfirmeInfo copyWith({
    String realName,
    String mobile,
    String passporttype,
    String passportnumber,
    String cardImgJust,
    String cardImgBack,
  }) {
    return ConfirmeInfo(
      realName: realName ?? this.realName,
      mobile: mobile ?? this.mobile,
      passporttype: passporttype ?? this.passporttype,
      passportnumber: passportnumber ?? this.passportnumber,
      cardImgJust: cardImgJust ?? this.cardImgJust,
      cardImgBack: cardImgBack ?? this.cardImgBack,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'realName': realName,
      'mobile': mobile,
      'passporttype': passporttype,
      'passportnumber': passportnumber,
      'cardImgJust': cardImgJust,
      'cardImgBack': cardImgBack,
    };
  }

  factory ConfirmeInfo.fromMap(Map<String, dynamic> map) {
    return ConfirmeInfo(
      realName: map['realName'],
      mobile: map['mobile'],
      passporttype: map['passporttype'],
      passportnumber: map['passportnumber'],
      cardImgJust: map['cardImgJust'],
      cardImgBack: map['cardImgBack'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfirmeInfo.fromJson(String source) => ConfirmeInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ConfirmeInfo(realName: $realName, mobile: $mobile, passporttype: $passporttype, passportnumber: $passportnumber, cardImgJust: $cardImgJust, cardImgBack: $cardImgBack)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConfirmeInfo &&
        other.realName == realName &&
        other.mobile == mobile &&
        other.passporttype == passporttype &&
        other.passportnumber == passportnumber &&
        other.cardImgJust == cardImgJust &&
        other.cardImgBack == cardImgBack;
  }

  @override
  int get hashCode {
    return realName.hashCode ^
        mobile.hashCode ^
        passporttype.hashCode ^
        passportnumber.hashCode ^
        cardImgJust.hashCode ^
        cardImgBack.hashCode;
  }
}
