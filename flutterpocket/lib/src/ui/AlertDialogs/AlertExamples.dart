import 'package:flutter/material.dart';
import 'package:flutterpocket/src/utils/constants.dart';
import 'package:flutterpocket/src/my_flutter_app_icons.dart';
//Color(0xff006a77)
class AlertExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Widgets'),
        backgroundColor: Color(Constants.ThemeColor),
        actions: <Widget>[
          Theme(
              data: Theme.of(context).copyWith(
                cardColor: Color(Constants.ThemeColor),
              ),
              child: PopupMenuButton<String>(tooltip: 'select',
              icon: Icon(MyFlutterApp.short_text,color: Color(Constants.FontColor),),
              itemBuilder: (BuildContext context){
                return Constants.options.map((String option){
                  return PopupMenuItem<String>(
                    value: option,
                    child: Text(option,style: TextStyle(color: Colors.white),),
                  );
                }).toList();
              },
            ),
            ),
        ],
      ),
      body: Container(
        color: Color(Constants.BgColor),
        padding: EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            MaterialButton(
              color: Color(Constants.ThemeColor),
              child: Text('Simple Alert',style: TextStyle(color: Colors.white)),
              splashColor: Color(0xFF80CBC4),
              highlightElevation: 2,
              minWidth: 250,
              height: 40,
              onPressed: (){this.showAlert(context);},
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),),
            MaterialButton(
              color: Color(Constants.ThemeColor),
              child: Text('Alert with Action',style: TextStyle(color: Colors.white),),
              splashColor: Color(0xFF80CBC4),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              minWidth: 250,
              height: 40,
              onPressed: (){
                this.showAlertAction(context);
              },
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),),
            MaterialButton(
              color: Color(Constants.ThemeColor),
              child: Text('Alert with Input',style: TextStyle(color: Colors.white)),
              shape: StadiumBorder(),
              splashColor: Color(0xFF80CBC4),
              minWidth: 250,
              height: 40,
              onPressed: (){
                this.showAlertInput(context);
              },
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),),
            MaterialButton(
              color: Color(Constants.ThemeColor),
              child: Text('Multiple Action',style: TextStyle(color: Colors.white)),
              splashColor: Color(0xFF80CBC4),
              minWidth: 250,
              height: 40,
              onPressed: (){
                this.showAlertManyAction(context);
              },
            ),
            // Card(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: <Widget>[
            //       Text('Icon Buttons'),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: <Widget>[
            //           IconButton(icon: Icon(Icons.mail),onPressed: (){},),
            //           IconButton(icon: Icon(Icons.send),onPressed: (){},),
            //           IconButton(icon: Icon(Icons.contacts),onPressed: (){},),
            //         ],
            //       )
            //     ],
            //   ),
            // )
            

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(tooltip: 'FloFloating Action Buttonat',
        child: Icon(Icons.add),
        backgroundColor: Color(Constants.ThemeColor),
        onPressed: (){},
      ),
    );
  }
  showAlert(context)
  {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          content: Text('This is a Simple Alert Dialog.'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        );
      }
    );
  }
  showAlertAction(context)
  {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          content: Text('Sure to leave this Page ?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text('No'),
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        );
      }
    );
  }
  showAlertInput(context)
  {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          title: Text('Enter your Email to Submit'),
          content: TextField(
              obscureText: false,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Enter Email",
                  labelText: 'Email'
              ),
            ),
          actions: <Widget>[
            FlatButton(
              child: Text('Submit'),
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        );
      }
    );
  }
  showAlertManyAction(context)
  {
    return showDialog<void>(
      context: context,
      builder: (context){
        return SimpleDialog(
          title: Text('Perform Any One'),
          children: <Widget>[
              SimpleDialogOption( child: Text('VIEW'),onPressed: (){},),
              SimpleDialogOption( child: Text('ADD'),onPressed: (){},),
              SimpleDialogOption( child: Text('REMOVE'),onPressed: (){},),
              SimpleDialogOption( child: Text('UPDATE'),onPressed: (){},),
              SimpleDialogOption( child: Text('SUBMIT'),onPressed: (){},),
            ],
        );
      }
    );
  }
}