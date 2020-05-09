import 'package:floard/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floard/styles/styles.dart';
import 'package:floard/widgets/vertical_marquee/vertical_marquee.dart';

class ScrollText extends StatefulWidget {
  ScrollText({Key key}) : super(key: key);
  @override
  ScrollTextState createState() => ScrollTextState();
}

class ScrollTextState extends State<ScrollText> {
  List<String> marqueeList = [];
  var controller = MarqueeController();

  @override
  void initState() {
    super.initState();
    initMarquee();
  }

  initMarquee() {
    marqueeList.clear();
    marqueeList
        .addAll(["3.8 版本绚丽登场啦！", "快来帮程序员脱单吧", "签到送豪礼，逢 “8” 有惊喜", "金秋十月，投资返现"]);
  }

  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colours.bg_color,
        navigationBar: CupertinoNavigationBar(
            brightness: Brightness.dark,
            backgroundColor: Colours.app_main,
            middle: Text("滚动文字", style: TextStyles.naviTitle)),
        child: GestureDetector(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                      height: 50.0,
                      width: 280,
                      color: Colors.transparent,
                      child: Marquee(
                        textList: marqueeList,
                        fontSize: 18.0, // text size
                        scrollDuration: Duration(
                            milliseconds: 200), // every scroll duration
                        stopDuration:
                            Duration(seconds: 3), //every stop duration
                        tapToNext: false, // tap to next
                        textColor: Colors.black, // text color
                        controller:
                            controller, // the controller can get the position
                      ),
                    ),
                    onTap: () {
                      print(controller.position); // get the position
                    },
                  ));
  }
}
