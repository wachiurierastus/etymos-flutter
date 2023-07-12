import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _ttTelephoneNumber = '';
  String get ttTelephoneNumber => _ttTelephoneNumber;
  set ttTelephoneNumber(String _value) {
    _ttTelephoneNumber = _value;
  }

  int _moves = 0;
  int get moves => _moves;
  set moves(int _value) {
    _moves = _value;
  }

  bool _isStarted = false;
  bool get isStarted => _isStarted;
  set isStarted(bool _value) {
    _isStarted = _value;
  }

  List<String> _boardLetters = [];
  List<String> get boardLetters => _boardLetters;
  set boardLetters(List<String> _value) {
    _boardLetters = _value;
  }

  void addToBoardLetters(String _value) {
    _boardLetters.add(_value);
  }

  void removeFromBoardLetters(String _value) {
    _boardLetters.remove(_value);
  }

  void removeAtIndexFromBoardLetters(int _index) {
    _boardLetters.removeAt(_index);
  }

  void updateBoardLettersAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _boardLetters[_index] = updateFn(_boardLetters[_index]);
  }

  List<int> _boardNumbers = [];
  List<int> get boardNumbers => _boardNumbers;
  set boardNumbers(List<int> _value) {
    _boardNumbers = _value;
  }

  void addToBoardNumbers(int _value) {
    _boardNumbers.add(_value);
  }

  void removeFromBoardNumbers(int _value) {
    _boardNumbers.remove(_value);
  }

  void removeAtIndexFromBoardNumbers(int _index) {
    _boardNumbers.removeAt(_index);
  }

  void updateBoardNumbersAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _boardNumbers[_index] = updateFn(_boardNumbers[_index]);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
