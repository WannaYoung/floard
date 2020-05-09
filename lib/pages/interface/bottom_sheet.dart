import 'package:floard/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floard/styles/styles.dart';

class BottomSheet extends StatefulWidget {
  BottomSheet({Key key}) : super(key: key);

  @override
  BottomSheetState createState() => BottomSheetState();
}

class BottomSheetState extends State<BottomSheet> {
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
            middle: Text("底部菜单", style: TextStyles.naviTitle)),
        child: Center(
            child: FlatButton(
                onPressed: () => {
                      showBottomSheet("选取图片", ["打开相机", "从相册选取", "从网络选取"])
                    },
                child: Text("选取"))));
  }

  showBottomSheet(String title, List<String> options) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        builder: (BuildContext context) {
          return Container(
              height: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )),
                  Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 20),
                          itemCount: options.length,
                          itemBuilder: (BuildContext context, int posion) {
                            return Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                                child: Text(
                                  options[posion],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ));
                          })),
                ],
              ));
        });
  }
}
