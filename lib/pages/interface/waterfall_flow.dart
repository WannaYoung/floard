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
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) => new Container(
              color: Colors.green,
              child: new Center(
                child: new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: new Text('$index'),
                ),
              )),
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ));
  }
}
