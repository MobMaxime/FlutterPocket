import 'package:flutter/material.dart';
import 'package:flutterpocket/src/blocs/Provider.dart';

class Dashboard extends StatelessWidget {
  final String title;
  Dashboard(this.title);
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: bloc.widgetArray.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: bloc.widgetIcon[index],
                  title: Text(bloc.widgetArray[index]),
                  onTap: () {},
                ),
              );
            },
          )),
    );
  }
}
