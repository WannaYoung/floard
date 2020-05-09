import 'package:floard/pages/interface/loading_hud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floard/styles/resources.dart';
import 'package:flutter_show_more/flutter_show_more.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SortCondition {
  String name;
  bool isSelected;

  SortCondition({this.name, this.isSelected});
}

class DropDownMenuPage extends StatefulWidget {
  @override
  DropDownMenuPageState createState() => DropDownMenuPageState();
}

class DropDownMenuPageState extends State<DropDownMenuPage> {
  List<String> _dropDownHeaderItemStrings = ['全城', '全部影院', '距离近', '筛选'];
  List<SortCondition> _brandSortConditions = [];
  List<SortCondition> _distanceSortConditions = [];
  SortCondition _selectBrandSortCondition;
  SortCondition _selectDistanceSortCondition;
  GZXDropdownMenuController _dropdownMenuController =
      GZXDropdownMenuController();

  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey _stackKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _brandSortConditions.add(SortCondition(name: '全部影院', isSelected: true));
    _brandSortConditions.add(SortCondition(name: '金逸影城', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '中影国际城', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '星美国际城', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '博纳国际城', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '大地影院', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '嘉禾影城', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '耀莱影城', isSelected: false));
    _selectBrandSortCondition = _brandSortConditions[0];

    _distanceSortConditions.add(SortCondition(name: '距离近', isSelected: true));
    _distanceSortConditions.add(SortCondition(name: '价格低', isSelected: false));
    _distanceSortConditions.add(SortCondition(name: '价格高', isSelected: false));
    _selectDistanceSortCondition = _distanceSortConditions[0];
  }

  @override
  Widget build(BuildContext context) {
    print('_GZXDropDownMenuTestPageState.build');

    return CupertinoPageScaffold(
      key: _scaffoldKey,
      navigationBar: CupertinoNavigationBar(
          brightness: Brightness.dark,
          backgroundColor: Colours.app_main,
          middle: Text("下拉菜单", style: TextStyles.naviTitle)),
      backgroundColor: Colors.white,
      child: Stack(
        key: _stackKey,
        children: <Widget>[
          Column(
            children: <Widget>[
//              SizedBox(height: 20,),
              // 下拉菜单头部
              GZXDropDownHeader(
                // 下拉的头部项，目前每一项，只能自定义显示的文字、图标、图标大小修改
                items: [
                  GZXDropDownHeaderItem(_dropDownHeaderItemStrings[0]),
                  GZXDropDownHeaderItem(_dropDownHeaderItemStrings[1]),
                  GZXDropDownHeaderItem(_dropDownHeaderItemStrings[2]),
                  GZXDropDownHeaderItem(_dropDownHeaderItemStrings[3],
                      iconData: CupertinoIcons.fullscreen_exit, iconSize: 16),
                ],
                // GZXDropDownHeader对应第一父级Stack的key
                stackKey: _stackKey,
                // controller用于控制menu的显示或隐藏
                controller: _dropdownMenuController,
                // 当点击头部项的事件，在这里可以进行页面跳转或openEndDrawer
                onItemTap: (index) {
                  if (index == 3) {
                  }
                },
                height: 50,
                borderWidth: 0.5,
                dividerHeight: 20,
                // 下拉时文字样式
                dropDownStyle: TextStyle(
                  fontSize: 13,
                  color: Colours.app_main,
                ),
                iconDropDownColor: Colours.app_main,
              )
            ],
          ),
          // 下拉菜单
          GZXDropDownMenu(
            // controller用于控制menu的显示或隐藏
            controller: _dropdownMenuController,
            // 下拉菜单显示或隐藏动画时长
            animationMilliseconds: 200,
            // 下拉菜单，高度自定义，你想显示什么就显示什么，完全由你决定，你只需要在选择后调用_dropdownMenuController.hide();即可
            menus: [
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40 * 8.0,
                  dropDownWidget: _buildAddressWidget((selectValue) {
                    _dropDownHeaderItemStrings[0] = selectValue;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40 * 8.0,
                  dropDownWidget:
                      _buildConditionListWidget(_brandSortConditions, (value) {
                    _selectBrandSortCondition = value;
                    _dropDownHeaderItemStrings[1] =
                        _selectBrandSortCondition.name == '全部影院'
                            ? '全部影院'
                            : _selectBrandSortCondition.name;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40.0 * _distanceSortConditions.length,
                  dropDownWidget: _buildConditionListWidget(
                      _distanceSortConditions, (value) {
                    _selectDistanceSortCondition = value;
                    _dropDownHeaderItemStrings[2] =
                        _selectDistanceSortCondition.name;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
            ],
          ),
        ],
      ),
    );
  }

  int _selectTempFirstLevelIndex = 0;
  int _selectFirstLevelIndex = 0;
  int _selectSecondLevelIndex = -1;

  _buildAddressWidget(void itemOnTap(String selectValue)) {
//    List firstLevels = new List<int>.filled(15, 0);
    List firstLevels = new List<String>.generate(15, (int index) {
      if (index == 0) {
        return '全部';
      }
      return '$index区';
    });

    List secondLevels = new List<String>.generate(15, (int index) {
      if (index == 0) {
        return '$_selectTempFirstLevelIndex区全部';
      }
      return '$_selectTempFirstLevelIndex$index街道';
    });

    return Row(
      children: <Widget>[
        Container(
          width: 120,
          child: ListView(
            padding: EdgeInsets.only(left: 30),
            children: firstLevels.map((item) {
              int index = firstLevels.indexOf(item);
              return GestureDetector(
                onTap: () {
                  _selectTempFirstLevelIndex = index;
                  if (_selectTempFirstLevelIndex == 0) {
                    itemOnTap('全城');
                    return;
                  }
                  setState(() {});
                },
                child: Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    child: _selectTempFirstLevelIndex == index
                        ? Text(
                            '$item',
                            style: TextStyle(
                                color: Colours.app_main, fontSize: 15),
                          )
                        : Text('$item',
                            style:
                                TextStyle(color: Colours.text, fontSize: 15))),
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: Container(
            child: _selectTempFirstLevelIndex == 0
                ? Container()
                : ListView(
                    children: secondLevels.map((item) {
                      int index = secondLevels.indexOf(item);
                      return GestureDetector(
                          onTap: () {
                            _selectSecondLevelIndex = index;
                            _selectFirstLevelIndex = _selectTempFirstLevelIndex;
                            if (_selectSecondLevelIndex == 0) {
                              itemOnTap(firstLevels[_selectFirstLevelIndex]);
                            } else {
                              itemOnTap(item);
                            }
                          },
                          child: Container(
                            height: 40,
                            alignment: Alignment.centerLeft,
                            child: Row(children: <Widget>[
                              SizedBox(
                                width: 20,
                              ),
                              _selectFirstLevelIndex ==
                                          _selectTempFirstLevelIndex &&
                                      _selectSecondLevelIndex == index
                                  ? Text(
                                      '$item',
                                      style: TextStyle(
                                          color: Colours.app_main,
                                          fontSize: 15),
                                    )
                                  : Text('$item',
                                      style: TextStyle(
                                          color: Colours.text, fontSize: 15)),
                            ]),
                          ));
                    }).toList(),
                  ),
          ),
        )
      ],
    );
  }

  _buildConditionListWidget(
      items, void itemOnTap(SortCondition sortCondition)) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          SortCondition goodsSortCondition = items[index];
          return GestureDetector(
            onTap: () {
              for (var value in items) {
                value.isSelected = false;
              }
              goodsSortCondition.isSelected = true;
              itemOnTap(goodsSortCondition);
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20),
              height: 40,
              child: Expanded(
                child: Text(
                  goodsSortCondition.name,
                  style: TextStyle(
                      color: goodsSortCondition.isSelected
                          ? Colours.app_main
                          : Colors.black,
                      fontSize: 13),
                ),
              ),
            ),
          );
        });
  }
}
