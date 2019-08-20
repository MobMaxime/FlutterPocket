import 'package:flutter/material.dart';
import 'package:flutterpocket/src/utils/constants.dart';

class SearchSample extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SeachView();
  }
}
class SeachView extends State<SearchSample>
{
  //final data  = List<String>.generate(100,(i)=>"Item $i");
  List<String> data = ['Manish Prajapati','Hardik Sharma','Nilesh','Raj','Vishal','Harsh','Mihir','Shahnavaz','Nemil','Parag'];
  TextEditingController editingController = TextEditingController();
  var items = List<String>();
  final style = TextStyle(color: Color(Constants.FontColor),);
  @override
  void initState() {
    // TODO: implement initState
    items.addAll(data);
    super.initState();
  }
  void filterSearchResults(String query)
  {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(data);
    if(query.isNotEmpty)
    {
        List<String> dummyListdata = List<String>();
        dummySearchList.forEach((item){
          if((item.toLowerCase()).contains(query.toLowerCase()))
          {
            dummyListdata.add(item);
          }
        });
        setState(() {
          items.clear();
          items.addAll(dummyListdata);
        });
        return;
    }
    else{
        setState(() {
          items.clear();
          items.addAll(data);
        });
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(Constants.BgColor),
      appBar: AppBar(
        title: Text('SearchSample'),
        backgroundColor: Color(Constants.ThemeColor),
      ),
      body:Container(
        margin: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  onChanged: (value){
                    filterSearchResults(value);
                  },
                  textDirection: TextDirection.ltr,
                  style: style,
                  textAlign: TextAlign.left,
                  controller: editingController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(icon: Icon(Icons.cancel),onPressed: (){
                      editingController.text='';
                      filterSearchResults('');
                    },),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)))
                  ),
                ),
              ),
              Expanded(
                child:  ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context,index){
                    return Card(color: Color(Constants.ThemeColor),
                      child: ListTile(
                        title: Text('${items[index]}',style: style,textDirection: TextDirection.ltr,),
                    ),
                    );
                  },
                ),
              ),
            ],
          ),
      ),
    );
  }
}
