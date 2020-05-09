import 'package:floard/source/item_source.dart';
import 'package:floard/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floard/styles/styles.dart';
import 'package:floard/widgets/base_gridview.dart';

class InterfacePage extends StatefulWidget {
  InterfacePage({Key key}) : super(key: key);

  @override
  InterfacePageState createState() => InterfacePageState();
}

class InterfacePageState extends State<InterfacePage> {
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
            middle: Text("界面", style: TextStyles.naviTitle)),
        child: BaseGridView(
          gridViewList: GridViewSource.interfaceSource,
          onTap: (section,index) {
            openInterfacePage(section, index);
          },
        ));
  }

  openInterfacePage(int section, int index) {
    Navigator.of(context, rootNavigator: true)
        .push(new CupertinoPageRoute(builder: (_) {
      return GridViewSource.interfaceSource[section].pages[index];
    }));
  }
}
