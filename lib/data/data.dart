import 'package:daichao/blocs/mine/user_bloc.dart';
import 'package:daichao/data/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> providers = [
  // 全局bloc，用户相关的bloc
  BlocProvider<UserBloc>(
    create: (BuildContext context) => UserRespository().userBloc,
  ),
];
// 首页Global
final GlobalKey mainMenusKey = GlobalKey();
// 路由Global
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// 颜色主题
Map<String, Color> themeColorMap = {
  'default': Color(0xFF148DFE),
  'gray': Colors.grey,
  'blue': Colors.blue,
  'blueAccent': Colors.blueAccent,
  'cyan': Colors.cyan,
  'deepPurple': Colors.purple,
  'deepPurpleAccent': Colors.deepPurpleAccent,
  'deepOrange': Colors.orange,
  'green': Colors.green,
  'indigo': Colors.indigo,
  'indigoAccent': Colors.indigoAccent,
  'orange': Colors.orange,
  'purple': Colors.purple,
  'pink': Colors.pink,
  'red': Colors.red,
  'teal': Colors.teal,
  'black': Colors.black,
};
