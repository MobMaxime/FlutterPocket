import 'package:flutter/material.dart';
import 'package:flutterpocket/src/utils/constants.dart';
class TabViewSample extends StatelessWidget {
  List<Container> tabContainers = new List();
  TabViewSample(this.title);
  final String title;
  final int tabLength = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
        length: tabLength,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(Constants.ThemeColor),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.person)),
                Tab(icon: Icon(Icons.settings)),
              ],
              indicatorColor: Colors.white,
            ),
            title: Text(this.title),
          ),
          body: TabBarView(
            children: tabContainerList(tabLength)
          ),
        ),
      ),
    );
  }
  tabContainerList(tabLength)
  {
    for(int i=0;i<tabLength;i++)
    {
      tabContainers.add(
        Container(
          padding: EdgeInsets.all(10.0),
          color: Color(Constants.BgColor),
          child: Image.asset('assets/nature/${Constants.natureImages[i]}',fit: BoxFit.fill,),
        )
      );
    }
    return tabContainers;
  }
}
