import 'package:flutter/material.dart';

class FromScreen extends StatelessWidget {
  const FromScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Record Form"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  autofocus: true,
                  decoration: new InputDecoration(labelText: "Name Item : "),
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "Amount : "),
                  keyboardType: TextInputType.number,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Add Item"),
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ));
  }
}
