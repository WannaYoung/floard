import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:floard/pages/tab_bar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  runApp(MyApp());
  configStatusBar();
  configLoading();
}

// 设置 Android 状态栏透明
configStatusBar() {
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

// 设置 Loading 全局样式
configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.blue
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.blue
    ..textColor = CupertinoColors.secondaryLabel
    ..maskColor = Colors.black38.withOpacity(0.1)
    ..maskType = EasyLoadingMaskType.custom
    ..userInteractions = false;
}

// 初始化 App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
        child: CupertinoApp(
      title: "ATF",
      home: TabBarPage(),
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
      ),
      localizationsDelegates: [RefreshLocalizations.delegate],
      supportedLocales: [const Locale("zh")],
      locale: const Locale("zh"),
    ));
  }
}
