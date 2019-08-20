import 'package:flutter/material.dart';
import 'package:flutterpocket/src/ui/ListView/ListExample4.dart';
import 'package:flutterpocket/src/ui/ListView/ListExample1.dart';
import 'package:flutterpocket/src/ui/ListView/ListExample2.dart';
import 'package:flutterpocket/src/ui/ListView/ListExample3.dart';
import 'package:flutterpocket/src/ui/SearchSample.dart';
import 'package:flutterpocket/src/utils/constants.dart';
class AllList extends StatelessWidget {
  final style = TextStyle(color: Color(Constants.FontColor),);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Sample'),
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
              title: Text('ListExample1',style: style,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => new ListExample1('ListExample1')));
              },),
            ),
            Card(color: Color(Constants.ThemeColor),
              child: ListTile(
              title: Text('ListExample2',style: style,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => new ListExample2('ListExample2')));
              },),
            ),
            Card(color: Color(Constants.ThemeColor),
              child: ListTile(
              title: Text('ListExample3',style: style,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => new ListExample3('ListExample3')));
              },),
            ),
            Card(color: Color(Constants.ThemeColor),
              child: ListTile(
              title: Text('ListExample4',style: style,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => new ListExample4('ListExample4')));
              },),
            ),
            Card(color: Color(Constants.ThemeColor),
              child: ListTile(
              title: Text('List With Search',style: style,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => new SearchSample()));
              },),
            ),
          ],
        ),
      ),
    );
  }
}