import 'package:flutter/material.dart';

class ListStuff extends StatefulWidget {
    ListStuff({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _ListStuffState createState() => _ListStuffState();
}

class _ListStuffState extends State<ListStuff> {
    int i = 0;
    Map<int, Thingy> _stuff = {};

    void addNewItem() {
        setState(() {
            _stuff[i] = Thingy(j: i, delete: removeItem);
            i++;
        });
    }

    void removeItem(int k) {
        setState(() {
            print(_stuff);
            _stuff.remove(k);
        });
    }

    @override
    Widget build(BuildContext context) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
                <Widget>[
                    FractionallySizedBox(
                        widthFactor: 1.0,
                        child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                FlatButton(
                                    child: Text("New Item"),
                                    color: Colors.orange,
                                    textColor: Colors.black,
                                    onPressed: addNewItem,
                                )
                            ],
                        ),
                    ),
                ] + _stuff.values.toList(),
        );
    }
}

class Thingy extends StatelessWidget {
    Thingy({Key key, this.j, this.delete}) : super(key: key);

    final int j;
    final Function(int) delete;

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
                        child: ThingyInput(itemNum: j.toString()),
                    ),
                    Container(
                        height: h,
                        child: IconButton(
                            onPressed: () => delete(this.j),
                            icon: Icon(Icons.delete),
                        ),
                    ),
                ]
            )
        );
    }
}

class ThingyInput extends StatelessWidget {
    ThingyInput({Key key, this.itemNum}) : super(key: key);

    final String itemNum;

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: EdgeInsets.only(left: 10),
            child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    labelText: "Item $itemNum",
                )
            ),
            alignment: Alignment.centerLeft,
        );
    }

}
