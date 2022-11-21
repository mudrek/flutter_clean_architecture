import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class BaseDatasourceMock {
  @visibleForTesting
  String get assetForTest;

  Future<T> execMock<T>(String file, {int delay = 1}) async {
    await Future.delayed(Duration(seconds: delay));
    try {
      var response = await _readMockedFile(file);
      return response;
    } on PlatformException catch (e) {
      throw Exception(e);
    }
  }

  Future _readMockedFile(String file) async {
    final fileLocation = 'assets/$file';
    var mock = '';

    try {
      mock = await rootBundle.loadString(fileLocation);
    } on FlutterError {
      mock = await rootBundle.loadString('/$assetForTest/$fileLocation');
    }
    return json.decode(mock);
  }
}
