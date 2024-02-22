import 'package:flutter/material.dart';
import 'package:todoey_app/widgets/model.dart';

class DataProvider extends ChangeNotifier {
  List<Task> _mylist = [];

  List<Task> get mylist => _mylist;

  void addTask(Task task) {
    _mylist.add(task);
    notifyListeners();
  }

  void toggleTask(int index) {
    if (index >= 0 && index < _mylist.length) {
      _mylist[index].toggleit();
      notifyListeners();
    }
  }

  deleteit(int index) {
    _mylist.removeAt(index);
    notifyListeners();
  }
}
