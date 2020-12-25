import 'package:flutter/material.dart';

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

class ListStuff extends StatefulWidget {
    ListStuff({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _ListStuffState createState() => _ListStuffState();
}

class _ListStuffState extends State<ListStuff> {
    List<String> _stuff;

    void _incrementCounter() {
        setState(() {});
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.title),
            ),
            body: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Text(
                            'You have pushed the button this many times:',
                        ),
                        Text(
                            '$_stuff',
                            style: Theme.of(context).textTheme.headline4,
                        ),
                    ],
                ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
        );
    }
}
