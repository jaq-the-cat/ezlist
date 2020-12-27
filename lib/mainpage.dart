import 'package:flutter/material.dart';

class ListStuff extends StatefulWidget {
    ListStuff({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _ListStuffState createState() => _ListStuffState();
}

class _ListStuffState extends State<ListStuff> {
    int i = 0;
    Map<int, Widget> _stuff = {};

    void _addNewItem() {
        setState(() {
            _stuff[i] = Thingy(delete: () => _removeItem(i));
            i++;
        });
    }

    void _removeItem(int j) {
        setState(() => _stuff.remove(j));
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
                            children: _stuff.values,
                        ),
                    )
                ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: _addNewItem,
                tooltip: 'Add new item',
                child: Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
        );
    }
}

class Thingy extends StatelessWidget {
    Thingy({Key key, this.delete}) : super(key: key);

    final VoidCallback delete;

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
                        child: ThingyInput(),
                    ),
                    Container(
                        height: h,
                        child: IconButton(
                            onPressed: delete,
                            icon: Icon(Icons.delete),
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
            padding: EdgeInsets.only(left: 10),
            child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    labelText: "New Item",
                )
            ),
            alignment: Alignment.centerLeft,
        );
    }

}
