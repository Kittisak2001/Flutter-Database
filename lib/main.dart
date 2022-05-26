import 'package:flutter/material.dart';
import 'package:flutter_database/models/Tranections.dart';
import 'package:flutter_database/providers/transection_provider.dart';
import 'package:flutter_database/screens/from_screen.dart';
import 'package:flutter_database/screens/home_screen.dart';
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: TabBarView(
          children: [
            HomeScreen(),
            FromScreen(),
          ],
        ),
        bottomNavigationBar: TabBar(tabs: [
          Tab(
            icon: Icon(Icons.list),
            text: "List",
          ),
          Tab(
            icon: Icon(Icons.add),
            text: "Add Item",
          ),
        ]),
      ),
    );
  }
}
