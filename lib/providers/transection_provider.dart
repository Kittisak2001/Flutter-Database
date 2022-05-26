import 'package:flutter/foundation.dart';
import 'package:flutter_database/database/transection_db.dart';
import 'package:flutter_database/models/Tranections.dart';

class TransectionProvider with ChangeNotifier{
  List <Transections> transection = [
  ];

  List <Transections> getTransection(){
    return transection;
  }

  void initData() async{
    var db = TransectionDB(dbName: "transection.db");
    transection = await db.LoadAllData();
    notifyListeners();
  }

  void addTransection(Transections statement) async{
    var db = TransectionDB(dbName: "transection.db");
    await db.InsertData(statement);
    transection = await db.LoadAllData();
    notifyListeners();

  }

}