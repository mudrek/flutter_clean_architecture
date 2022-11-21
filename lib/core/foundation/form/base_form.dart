import 'package:flutter/material.dart';

mixin BaseForm<T extends StatefulWidget> on State<T> {
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  void formUpdate() {
    FocusScope.of(context).unfocus();
    _formKey.currentState?.validate();
  }

  @override
  void dispose() {
    debugPrint('dispose form');
    _formKey.currentState?.dispose();
    super.dispose();
  }
}
