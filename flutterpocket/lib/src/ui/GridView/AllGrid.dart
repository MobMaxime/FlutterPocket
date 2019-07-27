import 'package:flutter/material.dart';
import 'package:flutterpocket/src/ui/GridView/GridExample1.dart';
import 'package:flutterpocket/src/ui/GridView/GridExample2.dart';
import 'package:flutterpocket/src/utils/constants.dart';
class AllGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Sample'),
        backgroundColor: Color(Constants.ThemeColor),
      ),
      body: Container(
        color: Color(Constants.BgColor),
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Card(child: ListTile(
              title: Text('Grid Example1',),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => new GridExample1('GridView Example1')));
              },
            ),),
            Card(child: ListTile(
              title: Text('Grid Example2',),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => new GridExample2('GridView Example2')));
              },
            ),),
          ],
        ),
      ),
    );
  }
}