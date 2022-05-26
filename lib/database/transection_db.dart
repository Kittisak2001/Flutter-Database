import 'dart:io';

import 'package:flutter_database/models/Tranections.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransectionDB{
  String? dbName;
 
  TransectionDB({this.dbName});

  Future <Database> openDatabase() async{
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String? dbLocation = join(appDirectory.path, dbName);

    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  Future <int> InsertData(Transections statement) async{
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");

    var keyID = store.add(db, {
      "title":statement.title,
      "amount":statement.amount,
      "date":statement.date!.toIso8601String()
    });
    db.close();
    return keyID;
  }

  Future <List<Transections>> LoadAllData() async{ 
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(db, finder: Finder(sortOrders: [SortOrder(Field.key, false)]));
    List <Transections> transectionList = List<Transections>.from(<List<Transections>>[]);
    for(dynamic record in snapshot){
      transectionList.add(
        Transections(
          title: record["title"], 
          amount: record["amount"], 
          date: DateTime.parse(record["date"])
          )
      );
    }
    return transectionList;

  }

}