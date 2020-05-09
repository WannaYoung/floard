import 'package:floard/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floard/styles/styles.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefrshLoadPage extends StatefulWidget {
  RefrshLoadPage({Key key}) : super(key: key);

  @override
  RefrshLoadPageState createState() => RefrshLoadPageState();
}

class RefrshLoadPageState extends State<RefrshLoadPage> with AutomaticKeepAliveClientMixin {
  int itemCount = 20;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  bool get wantKeepAlive => true;

  void onRefresh() async {
    refreshList(true);
  }

  void onLoading() async {
    refreshList(false);
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    refreshController.refreshCompleted();
    refreshController.loadComplete();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colours.bg_color,
        navigationBar: CupertinoNavigationBar(
            brightness: Brightness.dark,
            backgroundColor: Colours.app_main,
            middle: Text("下拉刷新", style: TextStyles.naviTitle)),
        child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: WaterDropHeader(),
            footer: ClassicFooter(),
            controller: refreshController,
            onRefresh: onRefresh,
            onLoading: onLoading,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: itemCount,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20),
                    height: 50,
                    child: Text(
                      "第 $index 行",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                    ),
                  );
                })));
  }

  refreshList(bool isRefresh) {
    EasyLoading.show();
    Future.delayed(Duration(seconds: 2), () {
      if (!mounted) { return; }
      setState(() {
      itemCount = isRefresh ? 20 : itemCount + 20;
      });
      refreshController.refreshCompleted();
      refreshController.loadComplete();
      EasyLoading.dismiss();
    });
  }
}
