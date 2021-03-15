import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> addItem(String text) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(text, "");
}

Future<void> removeItem(String text) async {
    final prefs = await SharedPreferences.getInstance();
    try {
        return prefs.remove(text);
    } catch(exc) {
        return;
    }
}

Future<Set<String>> getItems() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getKeys();
}

Future<String> addItemDialog(BuildContext context) {
    final ctrl = TextEditingController();
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) {
            return Dialog(
                child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    shrinkWrap: true,
                    children: <Widget>[
                        Column(
                            children: <Widget>[
                                TextFormField(
                                    inputFormatters: [
                                        LengthLimitingTextInputFormatter(25),
                                      ],
                                    autofocus: true,
                                    controller: ctrl,
                                    decoration: InputDecoration(
                                        labelText: "Add Item",
                                        labelStyle: TextStyle(
                                            color: Colors.deepOrange,
                                        ),
                                        fillColor: Colors.deepOrange,
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.deepOrange,
                                            ),
                                        ),
                                    ),
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                        TextButton(
                                            child: Text("CANCEL"),
                                            onPressed: () => Navigator.of(context).pop(""),
                                        ),
                                        TextButton(
                                            child: Text("CREATE"),
                                            onPressed: () {
                                                addItem(ctrl.text);
                                                Navigator.of(context).pop(ctrl.text);
                                            },
                                        ),
                                    ]
                                )
                            ]
                        ),
                    ],
                ),
            );
        }
    );
}


