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
            _stuff.add(Thingy(label: "New Item " + (_stuff.length + 1).toString()));
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
    Thingy({Key key, this.label}) : super(key: key);

    final String label;

    @override
    Widget build(BuildContext context) {
        const double h = 70;
        const double r = 10;
        return Container(
            height: h,
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(r),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Expanded(
                        child: ThingyInput(label: label),
                    ),
                    Container(
                        height: h,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete),
                        ),
                    ),
                ]
            )
        );
    }
}

class ThingyInput extends StatelessWidget {
    ThingyInput({Key key, this.label}) : super(key: key);

    final String label;

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: EdgeInsets.only(left: 10),
            child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    labelText: label,
                )
            ),
            alignment: Alignment.centerLeft,
        );
    }

}
