import 'package:flutter/material.dart';
import 'package:flutterpocket/src/ui/Dashboard/dashbord.dart';
import 'package:flutterpocket/src/blocs/Provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new Provider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Dashboard('Flutter Pocket'),
      ),
    );
  }
}
