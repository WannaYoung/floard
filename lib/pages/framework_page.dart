import 'package:floard/source/item_source.dart';
import 'package:floard/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floard/styles/styles.dart';
import 'package:floard/widgets/base_gridview.dart';

class FrameworkPage extends StatefulWidget {
  FrameworkPage({Key key}) : super(key: key);

  @override
  FrameworkPageState createState() => FrameworkPageState();
}

class FrameworkPageState extends State<FrameworkPage> {
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
            middle: Text("框架", style: TextStyles.naviTitle)),
        child: BaseGridView(
            gridViewList: GridViewSource.frameworkSource,
            onTap: (section, index) {
              print(index);
            }));
  }
}
