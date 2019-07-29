import 'package:flutter/material.dart';
import 'package:flutterpocket/src/utils/constants.dart';
class ScrollTabSample extends StatelessWidget {
  ScrollTabSample(this.title);
  final String title;
  final int tabLength = 8;
  List<Container> tabContainers = new List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
        length: 8,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(Constants.ThemeColor),
            bottom: PreferredSize(
              child: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.white.withOpacity(0.3),
                indicatorColor: Colors.white,
                tabs: [
                  Tab(icon: Text('Home')),
                  Tab(icon: Text('UserList')),
                  Tab(icon: Text('TaskList')),
                  Tab(icon: Text('AllTask')),
                  Tab(icon: Text('ClientList')),
                  Tab(icon: Text('Assignments')),
                  Tab(icon: Text('Report')),
                  Tab(icon: Text('Setting')),
                ],
            ),
            preferredSize: Size.fromHeight(30),
            ),
            title: Text(this.title),
          ),
          body: TabBarView(
            children: tabContainerList(tabLength),
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
          color: Color(Constants.BgColor),
          child: Image.asset('assets/nature/${Constants.natureImages[i]}',fit: BoxFit.fill,),
        )
      );
    }
    return tabContainers;
  }
}
