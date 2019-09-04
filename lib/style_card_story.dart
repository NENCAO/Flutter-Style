import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//通过stack重叠实现,这里的图片对象不宜太多
//反转是因为实现的时候底部在第一张
List<String> images = [
  "https://hbimg.huabanimg.com/362c7df95e2145f077cd6d8a9c8fbfaff3a31e6316b2e8-34YQeS_fw658",
  "https://hbimg.huabanimg.com/6b6a774f56120fda18d95aa41d0fcbb5ccc077aad246a-8hsU86_fw658",
  "https://hbimg.huabanimg.com/edc7517929587713964a90125af62ea777fd38f1b3ccf-O0VJNk_fw658",
  "https://hbimg.huabanimg.com/137236b1b2592b63e6b8b69133c9e98d9c83aac1ac2f0-og3hqA_fw658",
  "https://hbimg.huabanimg.com/b67917ec7c4501308002dd460b39dff574ccd69852cee-R6UaqW_fw658",
].reversed.toList();

//图片上的标题
List<String> title = [
  "Houted Ground",
  "Fallen In love",
  "The Dreaming Moon",
  "Jack the Persion and the Black Castel",
  "Android Flutter"
].reversed.toList();


class StyleStoryCard extends StatefulWidget {
  StyleStoryCard({Key key}) : super(key: key);

  @override
  _StyleStoryCard createState() => _StyleStoryCard();
}

var cardAspecRatio = 12.0 / 16.0;
var widgetAspecRatio = cardAspecRatio * 1.2;

class _StyleStoryCard extends State<StyleStoryCard> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return
      Stack(
        children: <Widget>[
          CardScrollWidget(currentPage),
          //只是用于currentPage参数的改变,实际不返回widget
          Positioned.fill(
              child: PageView.builder(
                itemCount: images.length,
                controller: controller,
                reverse: true,
                itemBuilder: (context,index){
                  return null;
                },
              )
          )
        ],
      );
  }
}

class CardScrollWidget extends StatelessWidget{
  var currentPage;
  //整体大小
  var padding = 20.0;
  //背部卡片的距离 越大背部卡片越小
  var verticalInset = 10.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new AspectRatio(
      aspectRatio: widgetAspecRatio,
      child: LayoutBuilder(
          builder: (context,contraints){
            var width = contraints.maxWidth;
            var height = contraints.maxHeight;

            var safeWidth = width - 2 * padding;
            var safeHeight = height - 2 * padding;

            var heightOfPrimaryCard = safeHeight;
            var widthOfPrimaryCard = heightOfPrimaryCard * cardAspecRatio;

            var primaryCardLeft = safeWidth - widthOfPrimaryCard;
            var horizontalInset = primaryCardLeft / 2;

            //卡片的数组 最终返回Stack childern 为list
            List<Widget> cardList = new List();

            for(var i = 0; i < images.length; i++){
              var delta = i - currentPage;
              bool isOnRight = delta > 0;

              var start = padding +
                  max(
                      primaryCardLeft -
                          horizontalInset * -delta * (isOnRight ? 15 : 1),
                      0.0);

              var cardItem = Positioned.directional(
                top: padding + verticalInset * max(-delta , 0.0),
                bottom: padding + verticalInset * max(-delta, 0.0),
                start: start,
                textDirection: TextDirection.rtl,

                child: ClipRRect(
                  //设置圆角
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    //设置阴影
                    decoration: BoxDecoration(
                      color: Colors.white,
                        boxShadow: [BoxShadow(
                        color: Colors.black26,
                        offset: Offset(3.0,3.0),
                        blurRadius: 8,
                      )],
                    ),
                    child: AspectRatio(
                      //限制大小
                      aspectRatio: cardAspecRatio,
                      //重叠模型
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          //图片
                          Image.network(images[i], fit: BoxFit.cover,),
                          //文字
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              //mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    title[i],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      //设置描边
                                      shadows: [
                                        Shadow(color: Colors.black54, offset: Offset(1.0,0.0),),
                                        Shadow(color: Colors.black54, offset: Offset(1.0,1.0),),
                                        Shadow(color: Colors.black54, offset: Offset(0.0,1.0),),
                                      ]
                                    )
                                    ,),
                                ),
                                //按钮
                                InkWell(
                                  onTap: null,
                                  child: Opacity(
                                    opacity: 0.8,
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 6.0,bottom: 12.0),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 22.0,vertical: 6.0),
                                          decoration: BoxDecoration(
                                              color: Colors.blueAccent,
                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: Text("Read",style: TextStyle(color: Colors.white,fontSize: 12),),
                                        )
                                    ),
                                  ),
                                )
                              ],
                            ),

                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
              cardList.add(cardItem);
            }
            return Stack(
              children: cardList,
            );
          }),
    );
  }
}

