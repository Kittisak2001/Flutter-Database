import 'package:flutter/foundation.dart';
import 'package:flutter_database/models/Tranection.dart';

class TransectionProvider with ChangeNotifier{
  List <Transection> transection = [
  ];

  List <Transection> getTransection(){
    return transection;
  }

  void addTransection(Transection statement){
    transection.insert(0,statement);

    notifyListeners();

  }

}