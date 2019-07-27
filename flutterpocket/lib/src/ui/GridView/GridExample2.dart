import 'package:flutter/material.dart';
import 'package:flutterpocket/src/utils/constants.dart';
class GridExample2 extends StatefulWidget {
  GridExample2(this.title);
  final String title;

  @override
  GridHeroSample createState() => GridHeroSample();
}
class GridHeroSample extends State<GridExample2>{
  List<Container> gridContainers = new List();
  
  buildList()async{
    for(var i=0;i<Constants.laptopImages.length;i++)
    {
        gridContainers.add(
          Container(
            padding : EdgeInsets.all(10.0),
            child: Card(child:
              SingleChildScrollView(
                child: Column(
                children: <Widget>[
                  Hero(
                    tag : Constants.laptopImages[i],
                    child: Material(
                      child: InkWell(
                        onTap: (){
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (BuildContext context){
                        //     return Detail(name:Constants.imgTextList[i],image:Constants.laptopImages[i]);
                        //   }
                        // ));
                        },
                        child: Image.asset('assets/laptop/${Constants.laptopImages[i]}',fit: BoxFit.cover,height: 100,),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.0),),
                  Text(Constants.imgTextList[i]),
                ],
              ),
              ),
            )
          )
        );
    }
  }
  @override
  void initState() {
    buildList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Color(Constants.ThemeColor),
          title: Text(widget.title),
      ),
      body: GridView.count(
              // primary: true,
              // padding: const EdgeInsets.all(20.0),
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,            
              children: gridContainers,
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
        backgroundColor: Color(Constants.ThemeColor),
        title: Text('Detail View'),
      ),
      body: Container(
        color: Colors.grey,
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(16.0),
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
    );
  }
}