import 'dart:async';

import 'bloc_base.dart';

class AppBloc extends BlocBase {
  AppBloc() {
    _numbers = List<int>.from(defaultNumbers);
    _numbersController.sink.add(_numbers);
    _inputController.stream.listen(_handleLogic);
  }

  static const List<int> defaultNumbers = [
    1,
    2,
    3,
    5,
    8,
    13,
    21,
    34,
    55,
    89,
    144
  ];

  List<int> _numbers;

  // Use as initialData
  List<int> get initialNumbers => _numbers;

  //
  // Stream to handle the numbers list
  //
  final StreamController<List<int>> _numbersController =
      StreamController<List<int>>.broadcast();

  //
  // Stream to handle the action on the numbers list
  //
  final StreamController<int> _inputController = StreamController<int>();

  // For adding new list into the stream
  StreamSink<List<int>> get _inAdd => _numbersController.sink;

  // To get the stream
  Stream<List<int>> get numbersList => _numbersController.stream;

  // To send new int or remove one
  StreamSink<int> get numbers => _inputController.sink;

  void dispose() {
    _numbersController.close();
    _inputController.close();
  }

  void _handleLogic(int data) {
    _numbers.contains(data) ? _numbers.remove(data) : _numbers.add(data);
    if (_numbers.isNotEmpty) {
      _numbers.sort();
    }
    _inAdd.add(_numbers);
  }
}
