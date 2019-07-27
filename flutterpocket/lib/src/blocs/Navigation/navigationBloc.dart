import 'dart:async';
import 'package:flutterpocket/src/blocs/Navigation/NavigationProvider.dart';
class NavigationBloc{

  final navigationController = StreamController();
  NavigationProvider navigationProvider = new NavigationProvider();
  
  Stream get getNavigation =>  navigationController.stream;

  void updateNavigation(String navigation){
      navigationProvider.updateNavigation(navigation);
      navigationController.sink.add(navigationProvider.currentNavigation);
  }

  dispose() {
    navigationController?.close();
  }
}