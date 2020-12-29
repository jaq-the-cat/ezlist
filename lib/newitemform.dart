import 'package:flutter/material.dart';

class NewItemForm extends StatefulWidget {

    NewItemForm({@required this.onSubmit}) : super();

    final Function(String) onSubmit;

    @override
    _NewItemFormState createState() => _NewItemFormState(onSubmit: this.onSubmit);
}

class _NewItemFormState extends State<NewItemForm> {

    _NewItemFormState({@required this.onSubmit}) : super();

    final Function(String) onSubmit;
    final _formKey = GlobalKey<FormState>();

    String text;

    @override
    Widget build(BuildContext context) {
        return Form(
            key: _formKey,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    Expanded(
                        child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "New Item",
                            ),
                            onChanged: (e) => _formKey.currentState.setState(() => this.text = e),
                        ),
                    ),
                    ElevatedButton(
                        child: Text('Submit'),
                        onPressed: () => this.onSubmit(this.text),
                    )
                ],
            ),
        );
    }
}
