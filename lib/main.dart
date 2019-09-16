import 'package:flutter/material.dart';
import 'package:flutter_story_app/routes/music.dart';
import 'routes/swiper_pic.dart';

void main() => runApp(MyApp());

Map<String, WidgetBuilder> g_RoutName = {
  '/swiper_pic': (context)=>SwiperPage(),
  '/music' : (context)=>MusicPage(),
};


class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: g_RoutName,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //路由按钮
  List<Widget> _buttonList = [];
  void _getButton(){
    //如果已经读取过路由, 返回
    if (!_buttonList.isEmpty) return;

    g_RoutName.forEach((key,value){
      var temp = Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
        width: double.infinity,
        child: RaisedButton(
          shape: StadiumBorder(),
          child: Text(key),
          onPressed: (){
            Navigator.pushNamed(context, key);
          },
        ),
      );
      _buttonList.add(temp);
    });
  }

  @override
  Widget build(BuildContext context) {
    _getButton();
    return Scaffold(
      backgroundColor: Colors.white,

      body: ListView(
        children: _buttonList
        )
      );
  }
}
