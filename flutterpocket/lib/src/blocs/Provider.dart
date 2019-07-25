import 'package:flutter/material.dart';
import 'Dashboard/dashborad_bloc.dart';
class Provider extends InheritedWidget{
  final bloc = Bloc();

  Provider({Key key , Widget child})
  :super(key:key,child:child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
  
  static Bloc of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}