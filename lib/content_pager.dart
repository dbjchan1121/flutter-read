import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_read/card_free.dart';
import 'package:flutter_read/card_recommend.dart';
import 'package:flutter_read/card_share.dart';
import 'package:flutter_read/card_special.dart';
import 'package:flutter_read/custom_appbar.dart';

class ContentPager extends StatefulWidget {
  const ContentPager({ Key? key, required this.onPageChanged, required this.contentPagerController}) : super(key: key);
  final ValueChanged<int> onPageChanged;
  final ContentPagerController contentPagerController;
  @override
  _ContentPagerState createState() => _ContentPagerState();
}

class _ContentPagerState extends State<ContentPager> {
  PageController _pageController = PageController(
    /**视窗比例 */
    viewportFraction: 0.8
  );
  static List<Color> _colors = [
    Colors.blue,
    Colors.red,
    Colors.deepOrange,
    Colors.teal,
  ];

  @override
  void initState() { 
    if (widget.contentPagerController != null) {
      widget.contentPagerController._pageController = _pageController;
    }
    _statusBar();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // appBar
        CustomAppbar(),
        Expanded(
          // 高度撑开
          child: PageView(
            onPageChanged: widget.onPageChanged,
            controller: _pageController,
            children: <Widget>[
              _wrapItem(CardRecommend()),
              _wrapItem(CardShare()),
              _wrapItem(CardFree()),
              _wrapItem(CardSpecial())
            ],
          )
        )
      ],
    );
  }
  Widget _wrapItem(Widget widget) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: widget
    );
  }
  // 沉浸式状态栏
  _statusBar() {
    // 黑色沉浸式状态栏，基于SystemUiOverlayStyle.dart修改statusBarColor
    SystemUiOverlayStyle uiOverlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarDividerColor: null,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(
      uiOverlayStyle
    );
  }
}
// 内容区域控制器
class ContentPagerController {
  PageController? _pageController;
  void jumpToPage(int page) {
    // dart 安全调用
    _pageController!.jumpToPage(page);
  }
}