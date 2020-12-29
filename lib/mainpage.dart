import 'package:flutter/material.dart';

class ListW extends StatefulWidget {
    ListW({Key key}) : super(key: key);

    @override
    State createState() => _ListWState();
}

class _ListWState extends State<ListW> {

    List<String> list = ["Hello", "Goodbye"];

    void add(String e) =>
        setState(() => list.add(e));

    void remove(String e) =>
        setState(() => list.remove(e));

    void editAt(int i, String e) =>
        setState(() => list[i] = e);

    List<Widget> buildWidgets() {
        List<Widget> c = [];
        for (String e in list) {
            c.add(ListWItem(text: e));
            c.add(SizedBox(height: 10));
        }
        c.removeAt(c.length-1); // remove last SizedBox
        return c;
    }

    @override
    Widget build(BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                FlatButton(
                    onPressed: () {},
                    child: Text("New Item"),
                    color: Colors.orange,
                ),
                SizedBox(height: 15),
            ] + buildWidgets(),
        );
    }
}

class ListWItem extends StatelessWidget {
    ListWItem({Key key, @required this.text}) : super(key: key);

    final String text;

    final double rad = 6;

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    Text(
                        text,
                        style: TextStyle(
                            fontSize: 18,
                        )
                    ),
                    Container(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(rad-1.5), bottomRight: Radius.circular(rad-1.5)),
                        )
                    ),
                ],
            ),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.orangeAccent,
                    width: 1.75,
                ),
                borderRadius: BorderRadius.circular(rad),
            ),
        );
    }
}
