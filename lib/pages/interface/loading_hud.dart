import 'package:floard/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floard/styles/styles.dart';
import 'package:floard/widgets/vertical_marquee/vertical_marquee.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingHud extends StatefulWidget {
  @override
  LoadingHudState createState() => LoadingHudState();
}

class LoadingHudState extends State<LoadingHud> {
  List<String> marqueeList = [];
  var controller = MarqueeController();

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
            middle: Text("加载Hud", style: TextStyles.naviTitle)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FlatButton(
                textColor: Colors.blue,
                padding: EdgeInsets.all(20),
                onPressed: () {
                  EasyLoading.show(status: 'loading...');
                  Future.delayed(Duration(seconds: 3), () {
                    EasyLoading.dismiss();
                  });
                },
                child: Text("show")),
            FlatButton(
                textColor: Colors.blue,
                padding: EdgeInsets.all(20),
                onPressed: () => EasyLoading.showSuccess('Great Success!'),
                child: Text("showSuccess")),
            FlatButton(
                textColor: Colors.blue,
                padding: EdgeInsets.all(20),
                onPressed: () => EasyLoading.showError('Failed with Error'),
                child: Text("showError")),
            FlatButton(
                textColor: Colors.blue,
                padding: EdgeInsets.all(20),
                onPressed: () => EasyLoading.showInfo('Useful Information.'),
                child: Text("showInfo")),
            FlatButton(
                textColor: Colors.blue,
                padding: EdgeInsets.all(20),
                onPressed: () => EasyLoading.showToast('Toast'),
                child: Text("showToast"))
          ],
        ));
  }
}
