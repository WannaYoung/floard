import 'package:flutter/material.dart';
import 'package:floard/models/gridview_entity.dart';
import 'package:floard/styles/resources.dart';
import 'package:floard/widgets/load_image.dart';

class BaseGridView extends StatelessWidget {
  const BaseGridView(
      {Key key, this.onTap, @required this.gridViewList})
      : super(key: key);

  final Function(int, int) onTap;
  final List<GridViewEntity> gridViewList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      itemCount: gridViewList.length,
      itemBuilder: (BuildContext context, int position) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(22, 10, 20, 0),
              child: Text(
                gridViewList[position].header,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500
                ),
                )
            ),
            GridView.builder(
      shrinkWrap: true,
      itemCount: gridViewList[position].titles.length,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 2,
      ),
      itemBuilder: (context, index) {
        return getItem(position, index);
      },
    )
          ],
        );
      }
    );
  }

  Widget getItem(int section, int index) {
    return GestureDetector(
        onTap: () => onTap(section, index),
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2, //阴影范围
                  spreadRadius: 1, //阴影浓度
                  color: Color(0x22CCCCCC), //阴影颜色
                )
              ],
            ),
            child: Container(
              margin: const EdgeInsets.only(left: 10.0),
              padding: const EdgeInsets.fromLTRB(0, 15.0, 10.0, 10.0),
              child: Row(
                //为了数字类文字居中
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  LoadAssetImage(gridViewList[section].images[index], width: 30.0),
                  Gaps.hGap5,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        gridViewList[section].titles[index],
                        style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400
                ),
                      ),
                      Gaps.vGap5,
                      Text(
                        gridViewList[section].subs[index],
                        style: TextStyles.textDark,
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
