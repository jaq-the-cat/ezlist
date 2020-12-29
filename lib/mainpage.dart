import 'package:flutter/material.dart';
import 'newitemform.dart';

class ListW extends StatefulWidget {
    ListW({Key key}) : super(key: key);

    @override
    State createState() => _ListWState();
}

class _ListWState extends State<ListW> {

    int i = 0;
    Map<int, String> list = {};
    bool inputThere = false;
    List<Widget> widgets = [];

    // callbacks
    void onNewItemPressed() {
        setState(() => this.inputThere = true);
    }

    void onSubmitPressed(String e) {
        setState(() {
            this.inputThere = false;
            list[i] = e;
            i++;
        });
    }

    void removeAt(int i) =>
        setState(() => list.remove(i));

    void addToWidgets(Widget w, double separator) {
        widgets.add(w);
        widgets.add(SizedBox(height: separator));
    }

    void buildWidgets() {
        print("${this.widgets}");
        setState(() {
            widgets.clear();

            if (this.inputThere) {
                addToWidgets(NewItemForm(onSubmit: onSubmitPressed), 30);
                this.inputThere = true;
            } else {
                addToWidgets(Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                        ElevatedButton(
                            onPressed: onNewItemPressed,
                            child: Text("New Item"),
                        ),
                    ],
                ), 10);
            }

            List<int> keys = list.keys;
            keys.sort();
            keys.reversed.forEach((k) {
                addToWidgets(ListWItem(text: list[k], onPressed: () => removeAt(k)), 10); // re-add them
            });

            if (widgets.length > 2)
                widgets.removeAt(widgets.length-1); // remove last SizedBox
        });
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
                        onPressed: this.onPressed,
                        icon: Icon(Icons.delete, color: Colors.red),
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
