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
                accentColor: Colors.deepOrange,
            ),
            home: ListStuff(title: 'EZLIST'),
        );
    }
}
