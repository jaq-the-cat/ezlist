import 'package:flutter/material.dart';

class ListW extends StatefulWidget {
    ListW({Key key}) : super(key: key);

    @override
    State createState() => _ListWState();
}

class _ListWState extends State<ListW> {

    List<String> list = ["Hello", "Goodbye"];
    bool input = false;
    List<Widget> widgets = [
        FlatButton(
            onPressed: () {},
            child: Text("New Item"),
            color: Colors.orange,
        ),
        SizedBox(height: 10),
    ];

    void onNewItemPressed() {
        setState(() => input = true);
    }

    void onAcceptPressed() {
            setState(() => input = false);
    }

    void add(String e) =>
        setState(() => list.add(e));

    void remove(String e) =>
        setState(() => list.remove(e));

    void editAt(int i, String e) =>
        setState(() => list[i] = e);

    void addToWidgets(Widget w) {
        widgets.add(w);
        widgets.add(SizedBox(height: 10));
    }

    void buildWidgets() {
        widgets.removeRange(2, widgets.length); // clear list widgets

        if (input)
            addToWidgets(ListWItem(text: "New", onPressed: onAcceptPressed));

        for (String e in list)
            addToWidgets(ListWItem(text: e, onPressed: onNewItemPressed)); // re-add them

        widgets.removeAt(widgets.length-1); // remove last SizedBox
    }

    @override
    Widget build(BuildContext context) {
        buildWidgets();
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgets,
        );
    }
}

class ListWItem extends StatelessWidget {
    ListWItem({Key key, @required this.text, @required this.onPressed}) : super(key: key);

    final String text;
    final VoidCallback onPressed;

    final double rad = 6;

    @override
    Widget build(BuildContext context) {
        return Container(
            height: 35,
            padding: EdgeInsets.only(left: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    Text(
                        text,
                        style: TextStyle(
                            fontSize: 18,
                        ),
                    ),
                    IconButton(
                        iconSize: 20,
                        onPressed: () {},
                        icon: Icon(Icons.delete),
                    ),
                ],
            ),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(width: 1.25, color: Colors.orangeAccent),
                ),
            ),
        );
    }
}
