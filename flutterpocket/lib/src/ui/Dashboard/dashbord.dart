import 'package:flutter/material.dart';
import 'package:flutterpocket/src/ui/DrawerExample.dart';
import 'package:flutterpocket/src/ui/GridView/AllGrid.dart';
import 'package:flutterpocket/src/ui/TabViewSample.dart';
import 'package:flutterpocket/src/utils/constants.dart';
import 'package:flutterpocket/src/blocs/Provider.dart';
import 'package:flutterpocket/src/blocs/Navigation/navigationBloc.dart';
import 'package:flutterpocket/src/ui/PageController.dart';
import 'package:flutterpocket/src/ui/SliversExample.dart';
import 'package:flutterpocket/src/ui/AlertExamples.dart';
import 'package:flutterpocket/src/ui/ListView/AllList.dart';

class Dashboard extends StatelessWidget {
  final String title;
  Dashboard(this.title);
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    final navBloc = NavigationBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        backgroundColor: Color(Constants.ThemeColor),
      ),
      body: Container(
        color: Color(Constants.BgColor),
          padding: EdgeInsets.all(10.0),
          child: ListView(children: <Widget>[
            Card(
                child: ListTile(
                  leading: bloc.widgetIcon[0],
                  title: Text(bloc.widgetArray[0]),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => new AllList()));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: bloc.widgetIcon[1],
                  title: Text(bloc.widgetArray[1]),
                  onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => new AllGrid()));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: bloc.widgetIcon[2],
                  title: Text(bloc.widgetArray[2]),
                  onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => new AlertExamples()));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: bloc.widgetIcon[3],
                  title: Text(bloc.widgetArray[3]),
                  onTap: () {
                      navBloc.updateNavigation(bloc.widgetController[5]);
                      if(navBloc.navigationProvider.currentNavigation==bloc.widgetController[5])
                      {
                        Navigator.of(context).push(MaterialPageRoute(
                           builder: (BuildContext context) => new SamplePageController()));
                           //return SamplePageController();
                      }
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: bloc.widgetIcon[4],
                  title: Text(bloc.widgetArray[4]),
                  onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(
                           builder: (BuildContext context) => new SliversExample()));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: bloc.widgetIcon[5],
                  title: Text(bloc.widgetArray[5]),
                  onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                           builder: (BuildContext context) => new TabViewSample('TabBar Example')));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: bloc.widgetIcon[6],
                  title: Text(bloc.widgetArray[6]),
                  onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                           builder: (BuildContext context) => new DrawerExample('Home')));
                  },
                ),
              ),
          ],)
        ),
    );
  }
}
