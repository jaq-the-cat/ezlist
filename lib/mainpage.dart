import 'package:flutter/material.dart';

class ListStuff extends StatefulWidget {
    ListStuff({Key key}) : super(key: key);

    @override
    _ListStuffState createState() => _ListStuffState();
}

class _ListStuffState extends State<ListStuff> {
    int i = 0;
    Map<int, String> _list = {};

    void addNewItem() {
        setState(() {
            _list[i] = '';
            i++;
        });
    }

    void removeItem(int k) {
        setState(() {
            _list.remove(k);
        });
    }

    List<Widget> buildWidgets() {
        List<Widget> l = [];
        _list.forEach((j, e) {
            Thingy(delete: () => removeItem(j));
        });
        return l;
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
                ] + buildWidgets(),
        );
    }
}

class Thingy extends StatelessWidget {
    Thingy({Key key, this.delete}) : super(key: key);

    final Function() delete;

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
                        child: ThingyInput(itemNum: "x"),
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

class ThingyInput extends StatefulWidget {
    ThingyInput({Key key, this.itemNum}) : super(key: key);

    final String itemNum;

    @override
    _ThingyInputState createState() => _ThingyInputState();
}

class _ThingyInputState extends State<ThingyInput> {

    String content = '';

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: EdgeInsets.only(left: 10),
            child: TextField(
                onChanged: (text) => this.content = text,
            ),
            alignment: Alignment.centerLeft,
        );
    }
}
