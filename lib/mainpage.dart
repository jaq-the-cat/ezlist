import 'package:flutter/material.dart';

class ListW extends StatefulWidget {
    ListW({Key key}) : super(key: key);

    @override
    State createState() => _ListWState();
}

class _ListWState extends State<ListW> {

    List<String> list = [];

    void add(String e) {
        setState(() => list.add(e));
    }

    void remove(String e) {
        setState(() => list.remove(e));
    }

    @override
    Widget build(BuildContext context) {
        return Column(
        );
    }
}
