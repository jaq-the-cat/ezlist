import 'package:flutter/material.dart';
import 'mainpage.dart';

void main() => runApp(Ezlist());

class Ezlist extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'ezlist',
            theme: ThemeData(
                visualDensity: VisualDensity.adaptivePlatformDensity,
                brightness: Brightness.dark,
                primaryColor: Colors.deepOrange,
                accentColor: Colors.orange,
                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                    ),
                ),
            ),
            home: Scaffold(
                appBar: AppBar(
                    title: Text('EZLIST'),
                ),
                body: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.all(25),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: ListW(),
                        )
                    ),
                ),
            ),
        );
    }
}
