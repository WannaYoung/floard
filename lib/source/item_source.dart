import 'package:floard/models/gridview_entity.dart';
import 'package:floard/pages/interface/banner_gallery.dart';
import 'package:floard/pages/interface/dropdown_menu.dart';
import 'package:floard/pages/interface/dropdown_refresh.dart';
import 'package:floard/pages/interface/index_list.dart';
import 'package:floard/pages/interface/loading_hud.dart';
import 'package:floard/pages/interface/scroll_text.dart';
import 'package:floard/pages/interface/text_showmore.dart';
import 'package:floard/pages/interface/waterfall_flow.dart';

class GridViewSource {
  static List<GridViewEntity> interfaceSource = [
    GridViewEntity(
      header: "文本",
      titles: ["文字轮播", "文字展开"],
      subs: ["上下滚动效果", "点击展开全文"],
      images: ["statistic/interface2", "statistic/interface4"],
      pages: [ScrollText(), MoreTextPage()]
    ),
    GridViewEntity(
      header: "图片",
      titles: ["图片轮播", "瀑布流"],
      subs: ["支持标题显示", "仿Pinterest效果"],
      images: ["statistic/interface1", "statistic/interface1"],
      pages: [BannerGallery(), WaterFallPage()]
    ),
    GridViewEntity(
      header: "列表",
      titles: ["下拉刷新", "列表索引"],
      subs: ["下拉上拉刷新", "索引和分组"],
      images: ["statistic/interface5", "statistic/interface6"],
      pages: [RefrshLoadPage(), IndexListPage()]
    ),
    GridViewEntity(
      header: "其他",
      titles: ["加载hud", "下拉菜单"],
      subs: ["支持加载和提示", "仿美团下拉筛选"],
      images: ["statistic/interface3", "statistic/interface6"],
      pages: [LoadingHud(), DropDownMenuPage()]
    )
  ];

  static List<GridViewEntity> functionSource = [
    GridViewEntity(
      header: "文本",
      titles: ["文字轮播", "文字展开"],
      subs: ["上下滚动效果", "点击展开全文"],
      images: ["statistic/interface2", "statistic/interface4"],
      pages: [ScrollText(), MoreTextPage()]
    ),
    GridViewEntity(
      header: "图片",
      titles: ["图片轮播"],
      subs: ["支持标题显示"],
      images: ["statistic/interface1"],
      pages: [BannerGallery()]
    )
  ];

  static List<GridViewEntity> frameworkSource = [
    GridViewEntity(
      header: "文本",
      titles: ["文字轮播", "文字展开"],
      subs: ["上下滚动效果", "点击展开全文"],
      images: ["statistic/interface2", "statistic/interface4"],
      pages: [ScrollText(), MoreTextPage()]
    )
  ];

}