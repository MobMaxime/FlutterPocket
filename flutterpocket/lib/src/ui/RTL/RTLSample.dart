import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutterpocket/src/utils/constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class RTLSample extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SeachView();
  }
}
class SeachView extends State<RTLSample>
{
  //final data  = List<String>.generate(100,(i)=>"Item $i");
  List<String> data = ['Manish Prajapati','Hardik Sharma','Nilesh','Raj','Vishal','Harsh','Mihir','Shahnavaz','Nemil','Parag'];
  TextEditingController editingController = TextEditingController();
  var items = List<String>();
  final style = TextStyle(color: Color(Constants.FontColor),);
  bool isLeftAlign = true;
  
  var align ;
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
  Widget getBack()
  {
    return IconButton(icon: Platform.isIOS ? Icon(Icons.arrow_back_ios) : Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(isLeftAlign)
      align = Locale("en", "US");
    else
      align = Locale("fa", "IR");

    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
         Locale("en", "US"),
         Locale("fa", "IR"),// OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale:align,
      home: Scaffold(
      backgroundColor: Color(Constants.BgColor),
      appBar: AppBar(
        leading: getBack() ,
        title: Text('SearchSample'),
        backgroundColor: Color(Constants.ThemeColor),
        actions: <Widget>[
          // IconButton(icon: Icon(Icons.arrow_back),onPressed: (){},)
        ],
      ),
      body:Container(
        margin: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('RightToLeft',style: TextStyle(fontSize: 18,color: Color(Constants.FontColor)),),
                  Switch(
                  value: !isLeftAlign,
                  activeColor: Color(Constants.ThemeColor),
                  onChanged: (bool nValue){
                    setState(() {
                      isLeftAlign = !isLeftAlign;
                    });
                  },
                ),
                ],
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  onChanged: (value){
                    filterSearchResults(value);
                  },
                  cursorColor: Color(Constants.ThemeColor),
                  style: style,
                  textAlign: isLeftAlign ? TextAlign.left : TextAlign.right,
                  controller: editingController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(icon: Icon(Icons.cancel),onPressed: (){
                      editingController.text='';
                      filterSearchResults('');
                    },),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: const BorderSide(color: Color(Constants.ThemeColor))
                      )
                  ),
                ),
              ),
              Expanded(
                child:  ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context,index){
                    return Card(color: Color(Constants.ThemeColor),
                      child: ListTile(
                        title: Text('${items[index]}',style: style),
                    ),
                    );
                  },
                ),
              ),
            ],
          ),
      ),
    ),
    ); 
  }
}
