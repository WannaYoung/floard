library banner_gallery_library;

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:floard/widgets/banner_gallery/banner_gallery_bean.dart';
import 'package:floard/widgets/banner_gallery/page_view_indicator.dart';

// 轮播的Banner Widget
class BannerGalleryWidget extends StatefulWidget {
  BannerGalleryWidget({
    this.data,
    this.customViewPageItemWidget,
    this.autoScrollDurationSeconds = 5,
    this.onPageTap,
    this.height = 180.0,
    this.bannerScrollDirection = Axis.horizontal,
    this.bannerMargin = const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 10),
    this.bannerBorderRadius = const BorderRadius.all(Radius.circular(10.0)),
    this.bannerDefaultBGColor = Colors.grey,
    this.bannerTextAlignment = Alignment.topLeft,
    this.bannerTextPadding =
        const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
    this.bannerTextColor = Colors.white,
    this.bannerTextBGColor = Colors.black54,
    this.indicatorPositioned = const Positioned(
      right: 20.0, 
      bottom: 15.0,
      child: null,
    ),
    this.indicatorScrollDirection = Axis.horizontal,
    this.indicatorNormalColor: Colors.white,
    this.indicatorSelectedColor: Colors.red,
    this.indicatorNormalSize: 6.0,
    this.indicatorScaleSize: 1.2,
    this.indicatorSpacing: 5.0,
    this.indicatorStyle: PageViewIndicatorStyle.circle,
    this.indicatorAnimStyle: PageViewIndicatorAnimStyle.scaled,
  });

  /// 内容数据
  final List<BannerGalleryBean> data;

  /// 自定义内容显示样式
  final List<Widget> customViewPageItemWidget;

  /// 自动滑动时间间隔[单位s]
  final int autoScrollDurationSeconds;

  /// Banner滑动方向[水平/垂直]
  final Axis bannerScrollDirection;

  /// Banner之间间距
  final EdgeInsetsGeometry bannerMargin;

  /// Banner圆角
  final BorderRadius bannerBorderRadius;

  /// Banner默认背景颜色
  final Color bannerDefaultBGColor;

  /// Banner文字位置
  final AlignmentGeometry bannerTextAlignment;

  /// Banner文字Padding
  final EdgeInsetsGeometry bannerTextPadding;

  /// Banner文字颜色
  final Color bannerTextColor;

  /// Banner文字背景颜色
  final Color bannerTextBGColor;

  /// 点击的事件监听
  final ValueChanged<int> onPageTap;

  /// View高度
  final double height;

  /// 指示器位置
  final Positioned indicatorPositioned;

  /// 指示器方向 [水平/垂直]
  final Axis indicatorScrollDirection;

  /// 指示器默认颜色
  final Color indicatorNormalColor;

  /// 指示器选中颜色
  final Color indicatorSelectedColor;

  /// 指示器点默认大小
  final double indicatorNormalSize;

  /// 指示器点选中放大倍数，默认1.4倍
  final double indicatorScaleSize;

  /// 指示器点的间距
  final double indicatorSpacing;

  final PageViewIndicatorStyle indicatorStyle;

  /// 指示器动画样式[normal: 选中变色, scaled:选中放大]
  final PageViewIndicatorAnimStyle indicatorAnimStyle;

  @override
  _BannerGalleryWidgetState createState() => _BannerGalleryWidgetState();
}

class _BannerGalleryWidgetState extends State<BannerGalleryWidget> {
  /// 轮播控制器
  Timer _timer;

  /// 控制器
  final PageController _controller = PageController(initialPage: 200);

  /// 获得真实数据的长度
  int _getReallyDataSize() {
    return widget.data != null ? widget.data.length : 0;
  }

  /// 有触摸的时候，将轮播控制器状态清空
  _resetTimer() {
    if (_timer != null) {
      _timer.cancel();
    }

    _timer = new Timer.periodic(
        new Duration(seconds: widget.autoScrollDurationSeconds), (Timer timer) {
      if (_controller.page != null) {
        var nextPageIndex = _controller.page.toInt() + 1;
        _toPage(nextPageIndex);
      }
    });
  }

  /// 跳转到指定ViewPager
  void _toPage(int page) {
    _controller.animateToPage(page,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  /// 生成默认的Item样式
  Widget _generateViewPageDefaultItem(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 8, //阴影范围
            spreadRadius: 1, //阴影浓度
            color: Colors.white12, //阴影颜色
          ),
        ],
        borderRadius: BorderRadius.circular(10), // 圆角也可控件一边圆角大小
      ),
      margin: widget.bannerMargin,
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(1000.0)),
        child: InkWell(
          onTap: () => widget.onPageTap(index),
          onTapDown: _resetTimer(),
          child: ClipRRect(
            borderRadius: widget.bannerBorderRadius,
            child: widget.customViewPageItemWidget != null
                ? widget.customViewPageItemWidget[index]
                : _generateDefaultView(index),
          ),
        ),
      )
    );
  }

  Widget _generateDefaultView(int index) {
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          color: widget.bannerDefaultBGColor,
          child: CachedNetworkImage(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            imageUrl: widget.data[index].photoUrl,
          ),
        ),
        _generateTextView(widget.data[index].description),
      ],
    );
  }

  /// 动态生成文字区域
  Widget _generateTextView(String content) {
    if (content == null || content.isEmpty) {
      return Container();
    }

    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Container(
          color: widget.bannerTextBGColor,
          padding: widget.bannerTextPadding,
          alignment: widget.bannerTextAlignment,
          child: Text(
            content,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(color: widget.bannerTextColor),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    _resetTimer();

    return SizedBox(
        height: widget.height,
        child: Container(
          child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            PageView.builder(
                scrollDirection: widget.bannerScrollDirection,
                controller: _controller,
                itemBuilder: (context, index) {
                  return _generateViewPageDefaultItem(
                      context, index % _getReallyDataSize());
                }),
            Positioned(
              left: widget.indicatorPositioned.left,
              top: widget.indicatorPositioned.top,
              right: widget.indicatorPositioned.right,
              bottom: widget.indicatorPositioned.bottom,
              child: PageViewIndicator(
                controller: _controller,
                itemCount: _getReallyDataSize(),
                size: widget.indicatorNormalSize,
                scrollDirection: widget.indicatorScrollDirection,
                normalColor: widget.indicatorNormalColor,
                selectedColor: widget.indicatorSelectedColor,
                spacing: widget.indicatorSpacing,
                scaleSize: widget.indicatorScaleSize,
                animStyle: widget.indicatorAnimStyle,
                style: widget.indicatorStyle,
                onPageSelected: (int page) {
                  _toPage(page);
                },
              ),
            ),
          ],
        )));
  }
}
