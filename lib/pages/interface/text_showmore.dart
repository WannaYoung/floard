import 'package:floard/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floard/styles/styles.dart';
import 'package:flutter_show_more/flutter_show_more.dart';

class MoreTextPage extends StatefulWidget {
  MoreTextPage({Key key}) : super(key: key);

  @override
  MoreTextPageState createState() => MoreTextPageState();
}

class MoreTextPageState extends State<MoreTextPage> {
  String showMoreText = "行和列是水平和垂直布局的基本、低级widget - 这些低级widget允许最大化的自定义。Flutter还提供专门的，更高级别的widget，可能足以满足您的需求。 例如，您可能更喜欢ListTile而不是Row，ListTile是一个易于使用的小部件，具有前后图标属性以及最多3行文本。ListView是一种列状布局，如果其内容太长而无法适应可用空间，则会自动滚动。 有关更多信息，请参阅通用布局widget。";
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
        middle: Text(
          "文本展开",
          style: TextStyles.naviTitle
        )
      ),
      child: Padding(
        padding: EdgeInsets.all(30),
        child: ShowMoreText(
                    showMoreText,
                    maxLength: 60,
                    style: TextStyle(
                      fontWeight: FontWeight.w400, 
                      fontSize: 15.0,
                    ),
                    showMoreText: '展开',
                    showLessText: '收起',
                    showMoreStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400, 
                      color: Theme.of(context).accentColor,
                    ),
                    shouldShowLessText: true,
                  )
        )
      );
  }
}