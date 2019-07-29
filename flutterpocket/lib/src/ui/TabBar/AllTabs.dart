import 'package:flutter/material.dart';
import 'package:flutterpocket/src/ui/TabBar/BottomTabSample.dart';
import 'package:flutterpocket/src/ui/TabBar/ScrollTabSample.dart';
import 'package:flutterpocket/src/ui/TabBar/TabViewSample.dart';
import 'package:flutterpocket/src/utils/constants.dart';
class AllTabs extends StatelessWidget {
  final style = TextStyle(color: Color(Constants.FontColor),);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabView Sample'),
        backgroundColor: Color(Constants.ThemeColor),
      ),
      body: Container(
        color: Color(Constants.BgColor),
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Card(color: Color(Constants.ThemeColor),
              child: ListTile(
              title: Text('Simple Tabbar',style: style,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => new TabViewSample('Simple Tabbar')));
              },
            ),),
            Card(color: Color(Constants.ThemeColor),
              child: ListTile(
              title: Text('Bottom Tabbar',style: style,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => new BottomTabSample('Bottom Tabbar')));
              },
            ),),
            Card(color: Color(Constants.ThemeColor),
              child: ListTile(
              title: Text('Scroll Tabbar',style: style,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => new ScrollTabSample('Scroll Tabbar')));
              },
            ),),
          ],
        ),
      ),
    );
  }
}