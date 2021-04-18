import 'package:flutter/foundation.dart';
import 'list.dart';


class TotalList extends ChangeNotifier{

  // ignore: non_constant_identifier_names
  List<Lists> TodoList = [
    Lists(name: 'Buy Milk',),
    Lists(name: 'Buy Car',),
  ];

  int get count{
    return TodoList.length;
  }

  void addTask (String st){
    final list=Lists(name: st);
    TodoList.add(list);
    notifyListeners();
  }

  void update(Lists list){
    list.toggle();
    notifyListeners();
  }

  void delete(int idx){
    TodoList.removeAt(idx);
    notifyListeners();
  }

}