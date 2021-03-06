import 'package:flutter/material.dart';
import 'package:flutter_database/main.dart';
import 'package:flutter_database/models/Tranections.dart';
import 'package:flutter_database/providers/transection_provider.dart';
import 'package:flutter_database/screens/home_screen.dart';
import 'package:provider/provider.dart';

class FromScreen extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Record Form"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: titleController,
                  autofocus: false,
                  decoration: new InputDecoration(labelText: "Name Item : "),
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return "Plase input Name Item.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: amountController,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return "Please, input amount.";
                    }
                    if (double.parse(str) <= 0) {
                      return "Please, input amount>0.";
                    }
                    return null;
                  },
                  decoration: new InputDecoration(labelText: "Amount : "),
                  keyboardType: TextInputType.number,
                ),
                FlatButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      var title = titleController.text;
                      var amount = amountController.text;
                      Transections statement = Transections(
                          title: title,
                          amount: double.parse(amount),
                          date: DateTime.now());
                      var provider = Provider.of<TransectionProvider>(context,
                          listen: false);
                      provider.addTransection(statement);

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MyHomePage(title: title);
                      }));
                    }
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
