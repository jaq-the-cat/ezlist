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
    List<Thingy> _stuff = [];

    void _incrementCounter() {
        setState(() {
            _stuff.add(Thingy(content: "Item " + (_stuff.length+1).toString()));
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.title),
            ),
            body: Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Text(
                            'ur stuf:',
                            style: Theme.of(context).textTheme.headline4,
                        ),
                    ] + _stuff,
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

class Thingy extends StatelessWidget {
    Thingy({Key key, this.content}) : super(key: key);

    final String content;

    @override
    Widget build(BuildContext context) {
        return Container(
            child: Text(
                content,
                style: TextStyle(
                    color: Colors.black,
                )
            ),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
            ),
        );
    }
}
