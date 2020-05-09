import 'package:cached_network_image/cached_network_image.dart';
import 'package:floard/models/waterfall_entity.dart';
import 'package:flutter/material.dart';

class WaterfallItem extends StatelessWidget {
  final WaterfallEntity waterfallEntity;
  WaterfallItem({this.waterfallEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
            blurRadius: 2, //阴影范围
            spreadRadius: 1, //阴影浓度
            color: Color(0x22CCCCCC), //阴影颜色
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
              child: CachedNetworkImage(imageUrl: waterfallEntity.imageUrl)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              waterfallEntity.title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    height: 24,
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(waterfallEntity.authorImageUrl),
                      radius: 12,
                      // maxRadius: 40.0,
                    )),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    waterfallEntity.author,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
