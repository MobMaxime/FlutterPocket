import 'package:flutter/material.dart';
import 'package:flutterpocket/src/utils/constants.dart';
import 'dart:math';
class GridExample1 extends StatelessWidget {
  GridExample1(this.title);
  final String title;
  int count=0;
  var randomIndex = new Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        backgroundColor: Color(Constants.ThemeColor),
      ),
      body: Container(
        color: Color(Constants.BgColor),
        child: ListView.builder(
              itemCount: 12,
              itemBuilder: (BuildContext context ,int root){
                return SizedBox(                  
                  height: 150,
                  width: 350,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (BuildContext context,int index){
                        return getGridView(randomIndex.nextInt(12));                                                  
                    },
                  ),
                );
              },
            ),
      )
        
    );
  }
  getGridView(index)
  {
    // if(index==3 || index==7)
    //   count=count+4;
    return Container(                        
        padding: EdgeInsets.all(10.0),
        width: 150,
        height: 150,
        child: ClipRRect(
          borderRadius: new BorderRadius.circular(8.0),
          child: Image.asset('assets/profile/${Constants.profileImages[index]}',width: 100,height: 150,),
        ),
      );
  }
}