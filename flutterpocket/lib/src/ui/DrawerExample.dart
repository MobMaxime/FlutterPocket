import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterpocket/src/utils/constants.dart';
class DrawerExample extends StatelessWidget {
  final String title;
  DrawerExample(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color(Constants.ThemeColor),
      ),
      drawer: getDrawer(context),
      drawerDragStartBehavior: DragStartBehavior.down,
      body: Container(color: Color(Constants.BgColor),),
    ); 
  }
}
Widget getDrawer(context)
{
  return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Manish Prajapati'),
              accountEmail: Text('manish.prajapati@mobmaxime.com'),
              currentAccountPicture: Image.asset('assets/profile/profile1.jpeg',width: 100,height: 100,fit: BoxFit.contain),
              decoration: BoxDecoration(color: Color(Constants.ThemeColor)),
            ),
            // DrawerHeader(
            //   child:Image.asset('images/user.png',
            //   width: 100,
            //   height: 100,
            //   fit: BoxFit.contain),
            //   decoration: BoxDecoration(color: Colors.blueAccent),
            // ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: (){
                  Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: (){
                  Navigator.pop(context);
              },
            ),
            //Divider(color: Colors.black,),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: (){
                Navigator.pop(context);
                },
            ),
            ListTile(
              leading: Icon(Icons.contact_phone),
              title: Text('Contact Us'),
              onTap: (){
                Navigator.pop(context);
                },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: (){
                Navigator.pop(context);
                },
            ),
            Divider(color: Colors.black,),
            ListTile(
              trailing: Icon(Icons.exit_to_app),
              title: Text('SignOut'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),

          ]),
      );
}