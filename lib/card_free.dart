import 'package:flutter/material.dart';
import 'package:flutter_read/base_card.dart';

class CardFree extends BaseCard{
  _CardFreeState createState() => _CardFreeState();
}

const BOOK_LIST = [
  { 'title': '非暴力沟通', 'cover': '51VykQqGq9L._SY346_.jpg', 'price': '19.6' },
  { 'title': '论中国', 'cover': '41APiBzC41L.jpg', 'price': '36.6' },
  { 'title': '饥饿的盛世：乾隆时代的得与失', 'cover': '51M6M87AXOL.jpg', 'price': '18.9' },
  { 'title': '焚天之怒第四卷至大结局', 'cover': '51oIE7H5gnL.jpg', 'price': '56.9' },
  { 'title': '我就是风口', 'cover': '51vzcX1U1FL.jpg', 'price': '88.7' },
  { 'title': '大宋的智慧', 'cover': '517DW6EbhGL.jpg', 'price': '22.6' },
];

class _CardFreeState extends BaseCardState {
  @override
  bottomContent() {
    // TODO: implement bottomContent
    return Expanded(child: Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Expanded(child: _bookList()),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: _bottomButton(),
          )
        ],
      ),
    ));
  }

  @override
  topTitle(String title) {
    return super.topTitle('免费听书馆');
  }

  Widget subTitle(String title) {
    return super.subTitle('第 108 期');
  }

  _bookList() {
    // 网格布局
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10, // 垂直间距
      crossAxisSpacing: 15,
      childAspectRatio: 0.46, // 水平间距
      padding: EdgeInsets.only(left: 20, right: 20),
      children: BOOK_LIST.map((item) {
        return _item(item);
      }).toList()
      ,
    );
  }

  Widget _item(Map<String, String> item) {
    return Container(
      child: Column(
        children: [
          // 绝对布局
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.network(
                'http://www.devio.org/io/flutter_beauty/book_cover/${item['cover']}',
                fit: BoxFit.cover,
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black38
                ),
                child: Icon(Icons.play_arrow, color: Colors.white,),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.black45
                  ), 
                  child: Text(
                    '原价${item['price']}',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '${item['title']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            
          )
        ],
      ),
    );
  }

  _bottomButton () {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: ElevatedButton(
          onPressed: () {

          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
            padding: MaterialStateProperty.all(EdgeInsets.only(top: 13, bottom: 15)),
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          child: Text('免费领取', style: TextStyle(color: Colors.white),),
        ),
      )
    );
    
  }
}