import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterpocket/src/utils/constants.dart';
class Bloc{
  List<String> widgetArray = Constants.widgetArray;
  List<String> widgetController = Constants.widgetController;
  List<String> images = Constants.images;
  List<Icon> widgetIcon = Constants.widgetIcon;
  StreamController<List<String>> _dataController = new StreamController<List<String>>.broadcast();
  
  Stream<List<String>> get listData =>  _dataController.stream;

  dispose() {
    _dataController?.close();
  }
}