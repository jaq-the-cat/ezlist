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
            body: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(25),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _stuff,
                        ),
                    )
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
        return Row(
            mainAxisSize: MainAxisSize.max,
            children: [
                Expanded(
                    child: Container(
                        child: Text(
                            content,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                            ),
                        ),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.fromLTRB(14, 12, 12, 12),
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(4),
                        ),
                    ),
            )
        ]
        );
    }
}
