import 'package:flutter/material.dart';
import 'package:flutterpocket/src/utils/constants.dart';
class ListExample1 extends StatelessWidget {
  ListExample1(this.title);
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
            return ListTile(
              title: Text(Constants.nameList[index]),
            );
          },
        ),
      ),
    );
  }
}