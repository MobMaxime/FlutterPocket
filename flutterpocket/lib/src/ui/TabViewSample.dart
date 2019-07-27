import 'package:flutter/material.dart';
import 'package:flutterpocket/src/utils/constants.dart';
class TabViewSample extends StatelessWidget {
  TabViewSample(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(Constants.ThemeColor),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.details)),
                Tab(icon: Icon(Icons.people)),
                Tab(icon: Icon(Icons.movie_filter)),
              ],
              indicatorColor: Colors.white,
            ),
            title: Text(this.title),
          ),
          body: TabBarView(
            children: [
              Container(color: Color(Constants.BgColor),),
              Container(color: Color(Constants.BgColor),),
              Container(color: Color(Constants.BgColor),),
            ],
          ),
        ),
      ),
    );
  }
}
