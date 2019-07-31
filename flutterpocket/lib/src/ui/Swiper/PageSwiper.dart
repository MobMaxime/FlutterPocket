import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterpocket/src/utils/constants.dart';
import 'package:flutterpocket/src/my_flutter_app_icons.dart';
class PageSwiper extends StatefulWidget {
  PageSwiper(this.title);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return MyPageSwiper();
  }
}
class MyPageSwiper extends State<PageSwiper> {
  var currentSwipper;
  @override
  Widget build(BuildContext context) {
    if(currentSwipper==null)
      currentSwipper = getSwipper1();
    return Scaffold(
      backgroundColor: Color(Constants.BgColor),
      appBar: AppBar(
        backgroundColor: Color(0xff006a77),
        title: Text(widget.title),
        actions: <Widget>[
          Theme(
              data: Theme.of(context).copyWith(
                cardColor: Color(Constants.ThemeColor),
              ),
              child: PopupMenuButton<String>(tooltip: 'change Swipe',
              icon: Icon(MyFlutterApp.short_text,color: Color(Constants.FontColor),),
              onSelected: performAction,
              itemBuilder: (BuildContext context){
                return Constants.swipOptions.map((String option){
                  return PopupMenuItem<String>(
                    value: option,
                    child: Text(option,style: TextStyle(color: Colors.white),),
                  );
                }).toList();
              },
            ),
            ),
        ],
      ),
      body: currentSwipper,
    );
  }
  
  void performAction(String action)
  {
    if(action==Constants.swipOptions[0])
    {
      setState(() {
        currentSwipper = getSwipper1();
      });
    }
    else if(action==Constants.swipOptions[1])
    {
      setState(() {
        currentSwipper = getSwipper2();
      });
    }
    else if(action==Constants.swipOptions[2])
    {
      setState(() {
        currentSwipper = getSwipper3();
      });
    }
    else if(action==Constants.swipOptions[3])
    {
      setState(() {
        currentSwipper = getSwipper4();
      });
    }
  }
  Widget getSwipper1()
  {
    return Swiper(
        itemBuilder: (BuildContext context , int index){
          return Container(
            child: SizedBox(
              child: Image.asset('assets/nature/${Constants.natureImages[index]}',fit: BoxFit.contain),
            ),
          );
        },
        itemCount: Constants.natureImages.length,
        pagination: new SwiperPagination(),
        // control: new SwiperControl()
      );
  }
  Widget getSwipper2()
  {
    return Swiper(
        itemBuilder: (BuildContext context , int index){
          return Container(
            child: SizedBox(
            child : Image.asset('assets/nature/${Constants.natureImages[index]}',fit: BoxFit.contain),
          ),
          );
          
        },
        itemCount: Constants.natureImages.length,
        pagination: new SwiperPagination(),
        viewportFraction: 0.8,
        scale: 0.9,
        
      );
  }
 Widget getSwipper3()
  {
    return Swiper(
        itemBuilder: (BuildContext context , int index){
          return Container(
            child: SizedBox(
            child : Image.asset('assets/nature/${Constants.natureImages[index]}',fit: BoxFit.contain),
          ),
          );
        },
        itemCount: Constants.natureImages.length,
        itemWidth: 300,
        layout: SwiperLayout.STACK,
        pagination: new SwiperPagination(),
      );
  }
   Widget getSwipper4()
  {
    return Swiper(
        itemBuilder: (BuildContext context , int index){
          return Container(
            child: SizedBox(
            child : Image.asset('assets/nature/${Constants.natureImages[index]}',fit: BoxFit.contain),
          ),
          );
          
        },
        itemCount: Constants.natureImages.length,
        itemWidth: 300,
        itemHeight: 400,
        layout: SwiperLayout.TINDER,
        pagination: new SwiperPagination(),
      );
  }
}