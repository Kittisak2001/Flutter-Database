import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/Tranections.dart';
import '../providers/transection_provider.dart';
import 'from_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TransectionProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Money Tracker"),
          actions: [
            IconButton(
              onPressed: (() {
                SystemNavigator.pop();
              }),
              icon: Icon(Icons.exit_to_app),
            ),
          ],
        ),
        body: Consumer(builder: (context, TransectionProvider provider,Widget? child) {
          var count = provider.transection.length;
          if(count <= 0 ){
            return Center(
              child: Text("ไม่พบข้อมูล", style: TextStyle(fontSize: 20),),
            );
          }
          return ListView.builder(
            itemCount: provider.transection.length,
            itemBuilder: (context, int index) {
              Transections data = provider.transection[index];
              return Card(
                elevation: 5, 
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                      radius: 30,
                      child: FittedBox(
                        child: Text(data.amount.toString()),
                      )),
                  title: Text(data.title.toString()),
                  subtitle: Text(DateFormat("dd/MM/yyyy").format(data.date!)),
                ),
              );
            });
        },));
  }
}