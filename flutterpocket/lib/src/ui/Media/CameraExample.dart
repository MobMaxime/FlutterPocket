
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutterpocket/src/utils/constants.dart';
class CameraExample extends StatefulWidget {
  CameraExample(this.title);
  final String title;
  @override
  CameraSample createState() => CameraSample();
}

class CameraSample extends State<CameraExample> {
  File selectedImage;
  final style = TextStyle(color: Color(Constants.FontColor),fontSize: 18);
  Future getImage(option) async {
    var image;
    if(option=='camera')
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    else if(option=='gallery')
      image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = image;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Constants.BgColor),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(Constants.ThemeColor),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.image),
            onPressed: (){
              return showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text('Select Any One'),
                      content: new SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            GestureDetector(
                              child: Text('Capture from Camera'),
                              onTap: (){
                                Navigator.pop(context);
                                getImage('camera');
                              },
                            ),
                            Padding(padding: EdgeInsets.all(10.0),),
                            GestureDetector(
                              child: Text('Select from Gallery'),
                              onTap: (){
                                  Navigator.pop(context);
                                  getImage('gallery');
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                );
            },
          )
        ],
      ),
      body: Container(
        child: Center(
          child: selectedImage==null ?
          Text('Image Not Selected',style: style,):
          Image.file(selectedImage),
        ),
      ),
    );
  }

}

