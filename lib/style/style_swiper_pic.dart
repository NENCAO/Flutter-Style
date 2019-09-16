import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../test_pic.dart';

//依赖 flutter_swiper插件

class HorizontalSwipeCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // 必须要容器的高度
    return Container(
      height: 350,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return ClipRRect(
            //设置图片圆角
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              images[index],
              fit: BoxFit.cover,

            ),
          );
        },
        itemCount: images.length,
        //分页指示器(圆点)
        pagination: SwiperPagination(),
        //自动轮播开关
        autoplay: true,
        //自动轮播间隔 毫秒
        duration: 500,
        //分页按钮(箭头)
        control: null,//SwiperControl(),
        //点击回调 index代表第几个轮播图
        onTap: (int index){},
        //用户拖动或自动播放引起下标改变
        onIndexChanged: (int index){},
        //中间图片比例
        viewportFraction: 0.7,
        //两边图片比例
        scale: 0.8,
      ),
    );
  }
}


class HorizontalSwipeCard2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // 必须要容器的高度
    return Container(
      height: 350,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return ClipRRect(
            //设置图片圆角
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              images[index],
              fit: BoxFit.cover,

            ),
          );
        },
        itemCount: images.length,
        //分页指示器(圆点)
        pagination: SwiperPagination(),
        //自动轮播开关
        autoplay: true,
        //自动轮播间隔 毫秒
        duration: 500,
        //分页按钮(箭头)
        control: null,//SwiperControl(),
        //点击回调 index代表第几个轮播图
        onTap: (int index){},
        //用户拖动或自动播放引起下标改变
        onIndexChanged: (int index){},
        //图片大小
        itemWidth: 300.0,
        //itemHeight: ,
        //图片展示方式
        layout: SwiperLayout.STACK,
      ),
    );
  }
}