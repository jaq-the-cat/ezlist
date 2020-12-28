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

    void setItemAt(int j, String t) {
        setState(() {
            _list[j] = t;
        });
    }

    void removeItem(int k) {
        setState(() {
            _list.remove(k);
        });
    }

    List<Widget> buildWidgets() {
        List<Widget> l = [];
        _list.forEach((i, text) {
            l.add(Thingy(initial: text, onChanged: (t) => setItemAt(i, t), delete: () => removeItem(i)));
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
    Thingy({Key key, @required this.initial, @required this.onChanged, @required this.delete}) : super(key: key);

    final String initial;
    final _controller = TextEditingController();

    final Function(String) onChanged;
    final Function() delete;

    @override
    Widget build(BuildContext context) {
        _controller.value = TextEditingValue(
            text: initial,
            selection: TextSelection.fromPosition(
                TextPosition(offset: initial.length),
            ),
        );
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
                        child: Container(
                            padding: EdgeInsets.only(left: 10),
                            child: TextField(
                                onChanged: onChanged,
                            ),
                            alignment: Alignment.centerLeft,
                        ),
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
