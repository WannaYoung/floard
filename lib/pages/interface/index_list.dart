import 'dart:convert';
import 'package:azlistview/azlistview.dart';
import 'package:floard/models/country_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:floard/styles/colors.dart';
import 'package:floard/styles/styles.dart';

class IndexListPage extends StatefulWidget {
  IndexListPage({Key key}) : super(key: key);

  @override
  IndexListPageState createState() => IndexListPageState();
}

class IndexListPageState extends State<IndexListPage> {
  List<CountryInfo> countryList = List();
  List<CountryInfo> hotCountryList = List();
  int suspensionHeight = 30;
  int itemHeight = 50;
  String suspensionTag = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    hotCountryList.add(
        CountryInfo(name: "China", code: "CN", dialCode: "+86", tagIndex: "★"));
    hotCountryList.add(CountryInfo(
        name: "America", code: "US", dialCode: "+1", tagIndex: "★"));

    rootBundle.loadString('assets/data/countrycode.json').then((value) {
      Map countryMap = json.decode(value);
      countryMap['list'].forEach((value) {
        countryList.add(CountryInfo(
            name: value['name'],
            code: value['code'],
            dialCode: value['dialCode']));
      });
      handleList(countryList);
      setState(() {
        suspensionTag = hotCountryList[0].getSuspensionTag();
      });
    });
  }

  handleList(List<CountryInfo> list) {
    if (list == null || list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String upperName = list[i].name.toUpperCase();
      String tag = upperName.substring(0, 1);
      list[i].upperName = upperName;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }
    //根据A-Z排序
    SuspensionUtil.sortListBySuspensionTag(countryList);
  }

  void onSusTagChanged(String tag) {
    setState(() {
      suspensionTag = tag;
    });
  }

  Widget buildSubsWidget(String susTag) {
    susTag = (susTag == "★" ? "Hot" : susTag);
    return Container(
      height: suspensionHeight.toDouble(),
      padding: const EdgeInsets.only(left: 20.0),
      color: Color(0xfff3f4f5),
      alignment: Alignment.centerLeft,
      child: Text(
        '$susTag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xff999999),
        ),
      ),
    );
  }

  Widget buildListItem(CountryInfo model) {
    String susTag = model.getSuspensionTag();
    susTag = (susTag == "★" ? "Hot" : susTag);
    return Column(
      children: <Widget>[
        Offstage(
          offstage: model.isShowSuspension != true,
          child: buildSubsWidget(susTag),
        ),
        SizedBox(height: itemHeight.toDouble(), child: getListRow(model))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        brightness: Brightness.dark,
        backgroundColor: Colours.app_main,
        middle: Text(
          "列表索引",
          style: TextStyles.naviTitle
        )
      ),
      child: Container(
          child: AzListView(
              data: countryList,
              topData: hotCountryList,
              itemBuilder: (context, model) => buildListItem(model),
              suspensionWidget: buildSubsWidget(suspensionTag),
              isUseRealIndex: true,
              itemHeight: itemHeight,
              suspensionHeight: suspensionHeight,
              onSusTagChanged: onSusTagChanged)),
    );
  }

  Widget getListRow(CountryInfo model) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 50, 0),
          child: Flex(direction: Axis.horizontal, children: <Widget>[
            Expanded(
              child: Text(model.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0)),
            ),
            Text(model.dialCode,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black38,
                  fontSize: 12.0,
                ))
          ]),
        ));
  }
}
