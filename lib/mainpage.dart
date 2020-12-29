import 'package:flutter/material.dart';

class ListW extends StatefulWidget {
    ListW({Key key}) : super(key: key);

    @override
    State createState() => _ListWState();
}

class _ListWState extends State<ListW> {

    List<String> list = [];

    void add(String e) =>
        setState(() => list.add(e));

    void remove(String e) =>
        setState(() => list.remove(e));

    void editAt(int i, String e) =>
        setState(() => list[i] = e);

    List<Widget> buildWidgets() {
        List<Widget> c = [];
        for (String e in list)
            c.add(ListWItem(text: e));
        return c;
    }

    @override
    Widget build(BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buildWidgets(),
        );
    }
}

class ListWItem extends StatelessWidget {
    ListWItem({Key key, @required this.text}) : super(key: key);

    final String text;

    @override
    Widget build(BuildContext context) {
        return Row(
            children: [
                Text(
                    text
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                ),
            ]
        );
    }
}
