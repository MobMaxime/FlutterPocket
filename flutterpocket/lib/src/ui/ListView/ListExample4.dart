import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterpocket/src/utils/constants.dart';
class ListExample4 extends StatelessWidget {
  ListExample4(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        backgroundColor: Color(Constants.ThemeColor),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: Constants.laptopImages.length,
          itemBuilder: (context,index){
            return Container(
              padding: EdgeInsets.all(10.0),
              child: Card(
                child: Column(
                children: <Widget>[
                  Hero(
                    tag : Constants.laptopImages[index],
                    child: Material(
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context){
                            return Detail(name:Constants.imgTextList[index],image:Constants.laptopImages[index]);
                          }
                        ));
                        },
                        child: Image.asset('assets/laptop/${Constants.laptopImages[index]}'),
                      ),
                    ),
                  ),
                  //Image.asset('assets/laptop/${Constants.laptopImages[index]}'),
                  Text(Constants.imgTextList[index]),
                ],
              ),
              )
            );
          },
        ),
      ),
    );
  }
}
class Detail extends StatelessWidget {
  Detail({this.name,this.image});
  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff006a77),
        title: Text('Product View'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Add TO Cart',
            icon: Icon(Icons.add_shopping_cart),
            onPressed: (){},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.topCenter,
            height: 250.0,
            child: Hero(
                    tag : image,
                    child: Material(
                      child: InkWell(
                        onTap: (){
                            Navigator.of(context).pop();
                        },
                        child: Image.asset('assets/laptop/$image',fit: BoxFit.fill,),
                      ),
                    ),
                  ),
          ),
          Text(name,style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}