// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';

Future<bool> isSolved(List<int> board) async {
  List<int> solvedList = [1, 2, 3, 4, 5, 6, 7, 8, 0];
  return listEquals(solvedList, board);
  // Add your function code here!
}
