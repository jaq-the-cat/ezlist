import 'package:flutter/material.dart';

class NewItemForm extends StatefulWidget {
    @override
    _NewItemFormState createState() => _NewItemFormState();
}

class _NewItemFormState extends State<NewItemForm> {

    final _formKey = GlobalKey<FormState>();

    @override
    Widget build(BuildContext context) {
        return Form(
            key: _formKey,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                ],
            ),
        );
    }
}