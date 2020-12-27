import 'package:flutter/material.dart';
import 'mainpage.dart';

void main() => runApp(Ezlist());

class Ezlist extends StatelessWidget {

    final ListStuff list = ListStuff();

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'ezlist',
            theme: ThemeData(
                visualDensity: VisualDensity.adaptivePlatformDensity,
                brightness: Brightness.dark,
                primaryColor: Colors.deepOrange,
                accentColor: Colors.deepOrange,
            ),
            //home: ListStuff(title: 'EZLIST'),
            home: Scaffold(
                appBar: AppBar(
                    title: Text('EZLIST'),
                ),
                body: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.all(25),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: list,
                        )
                    ),
                ),
            ),
        );
    }
}
