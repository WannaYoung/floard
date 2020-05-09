import 'package:floard/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floard/styles/styles.dart';

class TempPage extends StatefulWidget {
  TempPage({Key key}) : super(key: key);

  @override
  TempPageState createState() => TempPageState();
}

class TempPageState extends State<TempPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colours.bg_color,
      navigationBar: CupertinoNavigationBar(
        brightness: Brightness.dark,
        backgroundColor: Colours.app_main,
        middle: Text(
          "",
          style: TextStyles.naviTitle
        )
      ),
      child: Text("data"));
  }
}