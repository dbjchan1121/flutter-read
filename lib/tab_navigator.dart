import 'package:flutter/material.dart';
import 'package:flutter_read/content_pager.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({ Key? key }) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currIndex = 0;
  final ContentPagerController _contentPagerController = ContentPagerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffedeef0),
              Color(0xffe6e7e9)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ),
        ),
        child: ContentPager(
          contentPagerController: _contentPagerController,
          onPageChanged: (int index) {
            setState(() {
              _currIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _contentPagerController.jumpToPage(index);
          setState(() {
            _currIndex = index;
          });
        },
        items: [
        _bottomItem('本周', Icons.folder, 0),
        _bottomItem('分享', Icons.explore, 1),
        _bottomItem('免费', Icons.donut_small, 2),
        _bottomItem('长安', Icons.person, 3)
      ],),
    );
  }
  _bottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: _defaultColor,),
      activeIcon: Icon(icon, color: _activeColor,),
      title: Text(
        title,
        style: TextStyle(
          color: _currIndex != index ? _defaultColor : _activeColor
        ),
      )
    );
  }
}