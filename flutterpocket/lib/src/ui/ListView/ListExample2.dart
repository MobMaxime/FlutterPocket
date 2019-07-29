import 'package:flutter/material.dart';
import 'package:flutterpocket/src/utils/constants.dart';
class ListExample2 extends StatelessWidget {
  ListExample2(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        backgroundColor: Color(Constants.ThemeColor),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: Constants.nameList.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.person),backgroundColor: Color(Constants.ThemeColor),),
              title: Text(Constants.nameList[index]),
            ),
          );
          },
        ),
      ),
    );
  }
}