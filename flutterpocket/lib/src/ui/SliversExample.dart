import 'package:flutter/material.dart';
import 'package:flutterpocket/src/blocs/Provider.dart';
import 'package:flutterpocket/src/utils/constants.dart';
class SliversExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliver Sample'),
        backgroundColor: Color(Constants.ThemeColor),
      ),
      body:Container(
        child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: new Container(),
            expandedHeight: 100.0,
            backgroundColor: Color(Constants.ThemeColor),
          ),
          SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
                return Card(
                  color: Colors.blueGrey,
                  child: Image.asset(
                            bloc.images[index],
                            fit: BoxFit.contain,
                          ),
              );
            },
            childCount: 6,
          ),
        ),
          SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(height: 200.0,
                child: Card(
                  child: Image.asset('assets/lake.jpg',fit: BoxFit.cover,),
                ),
               ),
               Container(height: 200.0,
                child: Card(
                  child: Image.asset('assets/nature.jpg',fit: BoxFit.cover,),
                ),
               ),
            ]
          ),
        ),
        
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
                return GestureDetector(
                  child: Card(
                  color: Colors.blueGrey,
                  child: Image.asset(
                            bloc.images[index],
                            fit: BoxFit.contain,
                          ),
                    ),
                  onTap: () {
                    //showSnackBar(context,'OnTap gesture');
                    },
                ); 
            },
            childCount: 6,
          ),
        ),
        ],
      ),
      )
    );
  }
  showSnackBar(context,message)
  {
    final snackBar = SnackBar(
      content: Text(message),
      // action: SnackBarAction(
      //   label: 'Undo',
      //   onPressed: () {
      //     // Some code to undo the change.
      //   },
      // ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
