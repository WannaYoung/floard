import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floard/pages/framework_page.dart';
import 'package:floard/pages/function_page.dart';
import 'package:floard/pages/interface_page.dart';
import 'package:floard/styles/colors.dart';
import 'package:floard/widgets/load_image.dart';

class TabBarPage extends StatefulWidget {
  @override
  TabBarPageState createState() => TabBarPageState();
}

class TabBarPageState extends State<TabBarPage> {
  List<BottomNavigationBarItem> itemList;
  var tabBarTitles = ['界面', '功能', '框架'];
  var tabBarPages = [InterfacePage(), FunctionPage(), FrameworkPage()];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Colours.bg_color,
        activeColor: Colours.app_main,
        items: buildTabBarItem(),
        border: Border(
      top: BorderSide(
        color: Colors.black12,
        width: 0.3, // One physical pixel.
      ),
    )
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(builder: (BuildContext context) {
          return tabBarPages[index];
        });
      },
    );
  }

  List<BottomNavigationBarItem> buildTabBarItem() {
    if (itemList == null) {
      var _tabImages = [
        [
          const LoadAssetImage('home/icon_order', width: 25.0, color: Colours.unselected_item_color,),
          const LoadAssetImage('home/icon_order', width: 25.0, color: Colours.app_main,),
        ],
        [
          const LoadAssetImage('home/icon_commodity', width: 25.0, color: Colours.unselected_item_color,),
          const LoadAssetImage('home/icon_commodity', width: 25.0, color: Colours.app_main,),
        ],
        [
          const LoadAssetImage('home/icon_statistics', width: 25.0, color: Colours.unselected_item_color,),
          const LoadAssetImage('home/icon_statistics', width: 25.0, color: Colours.app_main,),
        ]
      ];
      itemList = List.generate(tabBarTitles.length, (i) {
        return BottomNavigationBarItem(
          icon: _tabImages[i][0],
          activeIcon: _tabImages[i][1],
          title: Text(
            tabBarTitles[i],
          ),
        );
      });
    }
    return itemList;
  }
}
