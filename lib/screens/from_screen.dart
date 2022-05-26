import 'package:flutter/material.dart';
import 'package:flutter_database/models/Tranection.dart';
import 'package:flutter_database/providers/transection.dart';
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
                  autofocus: true,
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
                      Transection statement = Transection(
                        title: title,
                        amount: double.parse(amount),
                        date: DateTime.now()
                      );
                      var provider = Provider.of<TransectionProvider>(context,
                          listen: false);
                      provider.addTransection(statement);

                      Navigator.pop(context);
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
