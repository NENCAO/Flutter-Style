import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_story_app/style/style_swiper_pic.dart';

class SwiperPage extends StatefulWidget {
  SwiperPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SwiperPageState createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: ListView(
        children: <Widget>[
          HorizontalSwipeCard(),
          //SizedBox(height: 50,),
          HorizontalSwipeCard2(),
        ],
      ),
    );
  }
}
