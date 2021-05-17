import 'package:flutter/material.dart';
import 'infoio.dart';

void main() => runApp(App());

class App extends StatefulWidget {
    @override
    State<App> createState() => AppState();
}

class AppState extends State<App> {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'EZLIST',
            theme: ThemeData(
                visualDensity: VisualDensity.adaptivePlatformDensity,
                brightness: Brightness.dark,
                primarySwatch: Colors.deepOrange,
                accentColor: Colors.deepOrange,
            ),
            home: Scaffold(
                appBar: AppBar(
                    title: Text('EZLIST'),
                ),
                floatingActionButton: Builder(builder: (context) => FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                        addItemDialog(context).then((v) => setState(() {}));
                    }
                )),
                body: FutureBuilder(
                    future: getItems(),
                    builder: (context, snapshot) {
                        if (!snapshot.hasData) return Container();
                        return ListView(
                            children: List<Widget>.from(
                                snapshot.data.map((e) => Container(
                                    margin: EdgeInsets.all(15),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                            FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Text(e),
                                            ),
                                            IconButton(
                                                icon: Icon(Icons.delete),
                                                color: Colors.red,
                                                onPressed: () {
                                                    removeItem(e).then((v) => setState(() {}));
                                                },
                                            ),
                                        ],
                                    ),
                                ))
                            ),
                        );
                    },
                ),
            ),
        );
    }
}
