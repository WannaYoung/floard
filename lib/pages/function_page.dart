import 'package:floard/source/item_source.dart';
import 'package:floard/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floard/styles/styles.dart';
import 'package:floard/widgets/base_gridview.dart';

class FunctionPage extends StatefulWidget {
  FunctionPage({Key key}) : super(key: key);

  @override
  FunctionPageState createState() => FunctionPageState();
}

class FunctionPageState extends State<FunctionPage> {
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
            middle: Text("功能", style: TextStyles.naviTitle)),
        child: BaseGridView(
            gridViewList: GridViewSource.functionSource,
            onTap: (section, index) {
              print(index);
            }));
  }
}
