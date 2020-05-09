import 'package:floard/models/waterfall_entity.dart';
import 'package:floard/pages/interface/waterflow_item.dart';
import 'package:floard/source/waterfall_source.dart';
import 'package:floard/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floard/styles/styles.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WaterFallPage extends StatefulWidget {
  WaterFallPage({Key key}) : super(key: key);

  @override
  WaterFallPageState createState() => WaterFallPageState();
}

class WaterFallPageState extends State<WaterFallPage> {
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
            middle: Text("瀑布流", style: TextStyles.naviTitle)),
        child: StaggeredGridView.countBuilder(
          padding: EdgeInsets.all(15),
          crossAxisCount: 4,
          itemCount: WaterfallSource.waterfallItems.length,
          itemBuilder: (BuildContext context, int index) => WaterfallItem(waterfallEntity: WaterfallSource.waterfallItems[index]),
          staggeredTileBuilder: (int index) =>
              StaggeredTile.fit(2),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ));
  }
}
