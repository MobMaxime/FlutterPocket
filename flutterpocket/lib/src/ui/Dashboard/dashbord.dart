import 'package:flutter/material.dart';
import 'package:flutterpocket/src/ui/Drawer/DrawerExample.dart';
import 'package:flutterpocket/src/ui/GridView/AllGrid.dart';
import 'package:flutterpocket/src/ui/MapView/MapExample.dart';
import 'package:flutterpocket/src/ui/Media/AllMediaList.dart';
import 'package:flutterpocket/src/ui/Swiper/PageSwiper.dart';
import 'package:flutterpocket/src/ui/TabBar/AllTabs.dart';
import 'package:flutterpocket/src/ui/WebView/WebViewExample.dart';
import 'package:flutterpocket/src/utils/constants.dart';
import 'package:flutterpocket/src/blocs/Provider.dart';
import 'package:flutterpocket/src/blocs/Navigation/navigationBloc.dart';
import 'package:flutterpocket/src/ui/PageController.dart';
import 'package:flutterpocket/src/ui/SliversExample.dart';
import 'package:flutterpocket/src/ui/AlertDialogs/AlertExamples.dart';
import 'package:flutterpocket/src/ui/ListView/AllList.dart';

class Dashboard extends StatelessWidget {
  final String title;
  final style = TextStyle(color: Color(Constants.FontColor),);
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
              color: Color(Constants.ThemeColor),
                child: ListTile(
                  leading: Icon(Icons.list,color: Color(Constants.FontColor),),
                  title: Text('ListView',style: style,),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => new AllList()));
                  },
                ),
              ),
              Card(
                color: Color(Constants.ThemeColor),
                child: ListTile(
                  leading: Icon(Icons.view_module,color: Color(Constants.FontColor),),
                  title: Text('GridView',style: style,),
                  onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => new AllGrid()));
                  },
                ),
              ),
              Card(
                color: Color(Constants.ThemeColor),
                child: ListTile(
                  leading: Icon(Icons.add_alert,color: Color(Constants.FontColor),),
                  title: Text('Alert Dialogs',style: style,),
                  onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => new AlertExamples()));
                  },
                ),
              ),
              Card(
                color: Color(Constants.ThemeColor),
                child: ListTile(
                  leading: Icon(Icons.tab,color: Color(Constants.FontColor),),
                  title: Text('TabBar',style: style,),
                  onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                           builder: (BuildContext context) => new AllTabs()));
                  },
                ),
              ),
               Card(
                color: Color(Constants.ThemeColor),
                child: ListTile(
                  leading: Icon(Icons.view_list,color: Color(Constants.FontColor),),
                  title: Text('Drawer',style: style,),
                  onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                           builder: (BuildContext context) => new DrawerExample('Home')));
                  },
                ),
              ),
              Card(
                color: Color(Constants.ThemeColor),
                child: ListTile(
                  leading: Icon(Icons.pageview,color: Color(Constants.FontColor),),
                  title: Text('Page Controller',style: style,),
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
                color: Color(Constants.ThemeColor),
                child: ListTile(
                  leading: Icon(Icons.view_agenda,color: Color(Constants.FontColor),),
                  title: Text('CustomScrollView',style: style,),
                  onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(
                           builder: (BuildContext context) => new SliversExample()));
                  },
                ),
              ),    
              Card(
                color: Color(Constants.ThemeColor),
                child: ListTile(
                  leading: Icon(Icons.navigation,color: Color(Constants.FontColor),),
                  title: Text('Swiper',style: style,),
                  onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(
                           builder: (BuildContext context) => new PageSwiper('Page Swiper')));
                  },
                ),
              ), 
              Card(
                color: Color(Constants.ThemeColor),
                child: ListTile(
                  leading: Icon(Icons.map,color: Color(Constants.FontColor),),
                  title: Text('Google Map',style: style,),
                  onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(
                           builder: (BuildContext context) => new MapExample()));
                  },
                ),
              ),  
              Card(color: Color(Constants.ThemeColor),
                child: ListTile(
                  leading: Icon(Icons.video_library,color: Color(Constants.FontColor),),
                  title: Text('Media',style: style,),
                  onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(
                           builder: (BuildContext context) => new AllMediaList()));
                  },
                ),
              ),
              Card(color: Color(Constants.ThemeColor),
                child: ListTile(
                  leading: Icon(Icons.web,color: Color(Constants.FontColor),),
                  title: Text('WebView',style: style,),
                  onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(
                           builder: (BuildContext context) => new WebViewExample('Web View')));
                  },
                ),
              ),    
       
             
          ],)
        ),
    );
  }
}
