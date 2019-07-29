import 'package:flutter/material.dart';
import 'package:flutterpocket/src/utils/constants.dart';
class BottomTabSample extends StatelessWidget{
  BottomTabSample(this.title);
  final String title;
  final int tabLength = 3;
  List<Container> tabContainers = new List();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(Constants.ThemeColor),
        title: Text(this.title),
      ),
      body: DefaultTabController(
        length: tabLength,
        child: Scaffold(
        backgroundColor: Color(Constants.ThemeColor),
        body: TabBarView( 
          children: tabContainerList(tabLength),
        ),
        bottomNavigationBar: new TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.home),),
            Tab(icon: Icon(Icons.list),),
            Tab(icon: Icon(Icons.settings),),
          ],
          labelColor:Color(Constants.FontColor) ,
          unselectedLabelColor: Color(Constants.BgColor),
          indicatorPadding: EdgeInsets.all(15.0),
          indicatorColor: Colors.white,
          labelPadding: EdgeInsets.all(10.0),
        ),
      ),
      ),
      backgroundColor: Colors.black,
    );
  }
  tabContainerList(tabLength)
  {
    for(int i=0;i<tabLength;i++)
    {
      tabContainers.add(
        Container(
          color: Color(Constants.BgColor),
          child: Image.asset('assets/nature/${Constants.natureImages[i]}',fit: BoxFit.fill,),
        )
      );
    }
    return tabContainers;
  }
}