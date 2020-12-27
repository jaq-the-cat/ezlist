import 'package:flutter/material.dart';

class ListStuff extends StatefulWidget {
    ListStuff({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _ListStuffState createState() => _ListStuffState();
}

class _ListStuffState extends State<ListStuff> {
    List<Widget> _stuff = [];

    void _incrementCounter() {
        setState(() {
            _stuff.add(Thingy(content: "New Item"));
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
        const double r = 10;
        return Container(
            height: 58,
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(r),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Expanded(
                        child: ThingyInput(),
                    ),
                    Container(
                        height: 64,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(r), bottomRight: Radius.circular(r)),
                        ),
                    ),
                ]
            )
        );
    }
}

class ThingyInput extends StatelessWidget {
    ThingyInput({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: EdgeInsets.all(10),
            child: TextField(
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                ),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: "New Item",
                )
            ),
            alignment: Alignment.centerLeft,
        );
    }

}
