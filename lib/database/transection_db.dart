import 'dart:io';

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


}