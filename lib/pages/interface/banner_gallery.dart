import 'package:floard/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floard/styles/styles.dart';
import 'package:floard/widgets/banner_gallery/banner_gallery_bean.dart';
import 'package:floard/widgets/banner_gallery/banner_gallery_library.dart';

class BannerGallery extends StatefulWidget {
  BannerGallery({Key key}) : super(key: key);

  @override
  BannerGalleryState createState() => BannerGalleryState();
}

class BannerGalleryState extends State<BannerGallery> {
  List<String> bannersTitle = [
    "3.8 版本绚丽登场啦！",
    "快来帮程序员脱单吧",
    "签到送豪礼，逢 “8” 有惊喜",
    "金秋十月，投资返现"
  ];
  List<String> bannersUrl = [
    "https://i.loli.net/2020/04/29/5X841M2UCkva3mS.jpg",
    "https://i.loli.net/2020/04/29/aPFTKNZX5qnz9g7.jpg",
    "https://i.loli.net/2020/04/29/WTYdN56Fplh123j.jpg",
    "https://i.loli.net/2020/04/29/wjBdnYU38tbZVpg.jpg"
  ];
  List<BannerGalleryBean> bannerGallery = [];

  @override
  void initState() {
    super.initState();
    getBannerGallery();
  }

  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colours.bg_color,
        navigationBar: CupertinoNavigationBar(
            brightness: Brightness.dark,
            backgroundColor: Colours.app_main,
            middle: Text("图片轮播", style: TextStyles.naviTitle)),
        child: BannerGalleryWidget(
          data: bannerGallery,
          onPageTap: (index) {
            print(index);
          },
        ));
  }

  // 生成轮播图
  void getBannerGallery() {
    List<BannerGalleryBean> tempGallery = [];
    for (var i = 0; i < bannersUrl.length; i++) {
      tempGallery.add(BannerGalleryBean(
          id: i.toString(),
          photoUrl: bannersUrl[i],
          description: bannersTitle[i]));
    }
    if (!mounted) return;
    setState(() {
      bannerGallery = tempGallery;
    });
  }
}
