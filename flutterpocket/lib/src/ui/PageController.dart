import 'package:flutter/material.dart';
import 'package:flutterpocket/src/utils/constants.dart';
class SamplePageController extends StatelessWidget {
  final style = TextStyle(color: Colors.white,fontSize: 16);
  @override
  Widget build(BuildContext context) {
    final mainController = PageController(
    initialPage: 0,
  );
  final pageView1 = PageView(
    controller: mainController,
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      Container(child: Image.asset('assets/wp1.jpg',fit: BoxFit.fill,),),
      Container(child: Image.asset('assets/wp2.jpg',fit: BoxFit.fill,),),
      Container(child: Image.asset('assets/wp3.jpg',fit: BoxFit.fill,),),
      Container(child: Image.asset('assets/wp4.jpg',fit: BoxFit.fill,),),
    ],
  );
  final pageView2 = PageView(
    controller: mainController,
    scrollDirection: Axis.vertical,
    children: <Widget>[
      Container(child: Image.asset('assets/wp5.jpg',fit: BoxFit.fill,),),
      Container(child: Image.asset('assets/wp2.jpg',fit: BoxFit.fill,),),
      Container(child: Image.asset('assets/wp3.jpg',fit: BoxFit.fill,),),
      Container(child: Image.asset('assets/wp4.jpg',fit: BoxFit.fill,),),
    ],
  );
    return Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text('PageController'),
              backgroundColor: Color(Constants.ThemeColor),
              bottom: TabBar(
                labelPadding: EdgeInsets.all(10.0),
                tabs: <Widget>[
                  Text('Horizontal',style: style,),
                  Text('Vertical',style: style,),
                ],
                indicatorColor: Colors.white,
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                pageView1,
                pageView2
              ],
            ),
          ),
        ),    
    );
  }
}