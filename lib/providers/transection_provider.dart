import 'package:flutter/foundation.dart';
import 'package:flutter_database/database/transection_db.dart';
import 'package:flutter_database/models/Tranections.dart';

class TransectionProvider with ChangeNotifier{
  List <Transections> transection = [
  ];

  List <Transections> getTransection(){
    return transection;
  }

  void addTransection(Transections statement) async{
    var db = await TransectionDB(dbName: "transection.db").openDatabase();
    print(db);
    transection.insert(0,statement);

    notifyListeners();

  }

}