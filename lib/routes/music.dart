import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_story_app/style/style_music.dart';


class MusicPage extends StatefulWidget {
  MusicPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: ListView(
        children: <Widget>[
          MusicCoverCircle()
        ],
      ),
    );
  }
}
