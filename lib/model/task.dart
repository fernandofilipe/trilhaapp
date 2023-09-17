import 'package:flutter/widgets.dart';

class Task {
  final String _id = UniqueKey().toString();
  String _description = "";
  bool _isDone = false;

  Task(this._description, this._isDone);

  String get id => _id;
  String get description => _description.toString().trim();
  bool get isDone => _isDone;

  set description(String description) {
    _description = description;
  }

  set isDone(bool isDone) {
    _isDone = isDone;
  }
}
