import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const List<String> defaultsImage = [
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tdgve1j30ku0bsn76.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2whp87sj30ku0bstec.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tl1v3bj30ku0bs77z.jpg',
];

// 图片宽高
var imageWidth = 750.0;
var imageHeight = 424.0;

class CommonSwiper extends StatelessWidget {
  final List<String> images;
  CommonSwiper({this.images = defaultsImage});
  
  @override
  Widget build(BuildContext context) {
    // 处理不同屏幕的高
    var height = MediaQuery.of(context).size.width / imageWidth * imageHeight;
    return Container(
      height: height,
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return new Image.network(images[index],fit: BoxFit.fill,);
        },
        autoplay: true,
        itemCount: images.length,
        pagination: new SwiperPagination(),
        // control: new SwiperControl(),
      ),
    );
  }
}