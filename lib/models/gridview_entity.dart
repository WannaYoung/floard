import 'package:flutter/material.dart';

class GridViewEntity {
  String header;
  List<String> titles;
  List<String> subs;
  List<String> images;
  List<Widget> pages;

  GridViewEntity(
      {this.header, this.titles, this.subs, this.images, this.pages});
}
