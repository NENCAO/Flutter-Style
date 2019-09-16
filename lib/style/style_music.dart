
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_story_app/test_pic.dart';
import 'package:fluttery_seekbar/fluttery_seekbar.dart';



//带进度的圆
class MusicCoverCircle extends StatefulWidget{
  MusicCoverCircle({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MusicCoverPageState createState() => _MusicCoverPageState();
}

class _MusicCoverPageState extends State<MusicCoverCircle> {
  //进度百分比
  double _thumbPercent = 0.4;

  Widget _buildRadialSeekBar(){
    return RadialSeekBar(
      //未走过的进度条颜色
      trackColor: Colors.blueAccent.withOpacity(0.5),
      //未走过的进度条宽度
      trackWidth: 2.0,
      //已经走过的进度条颜色
      progressColor: Colors.blue,
      //已经走过的进度条宽度
      progressWidth: 5.0,
      //进度条百分比
      thumbPercent: _thumbPercent,
      thumb: CircleThumb(
        //进度条头的颜色
        color: Colors.blue,
        //进度条头的大小
        diameter: 20.0,
      ),
      progress: _thumbPercent,
      onDragUpdate: (double percent){
        setState(() {
          _thumbPercent = percent;
        });
      },
    );
  }

  //圆的大小
  double _height = 250.0;
  double _width = 250.0;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: _height,
      width:  _width,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: Padding(
              //设置轨道边距
              padding: EdgeInsets.all(10),
              child: _buildRadialSeekBar(),
            )
          ),
          Center(
            child: Container(
              width: _width - 50,
              height: _height - 50,
              child: ClipOval(
                child: Image.network(images[0],fit: BoxFit.cover,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}