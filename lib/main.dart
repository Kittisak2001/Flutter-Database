import 'package:flutter/material.dart';
import 'package:flutter_database/models/Tranection.dart';
import 'package:flutter_database/providers/transection.dart';
import 'package:flutter_database/screens/from_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransectionProvider();
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Accounting App'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              onPressed: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return FromScreen();
                  }),
                );
              }),
              icon: Icon(Icons.add),
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
              Transection data = provider.transection[index];
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
