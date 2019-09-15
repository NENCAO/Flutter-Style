
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttery_seekbar/fluttery_seekbar.dart';

class MusicCover extends StatefulWidget{
  MusicCover({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MusicCoverPageState createState() => _MusicCoverPageState();
}


class _MusicCoverPageState extends State<MusicCover> {

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



  @override
  Widget build(BuildContext context) {

    return Container(
      height: 250,
      width:  250,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: _buildRadialSeekBar(),
          )
        ],
      ),
    );
  }
}