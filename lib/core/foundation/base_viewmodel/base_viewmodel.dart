import 'package:flutter/material.dart';

import '../base_repository/base_repository.dart';
import '../data/result.dart';
import 'view_contract.dart';

abstract class BaseViewModel<T> {
  late final ViewContract<T> view;

  final loading = ValueNotifier<bool>(false);

  Future<Result<T>> update(Task<Result<T>> task) async {
    loading.value = true;
    return await task();
  }

  void loadingOff({bool withDelay = true}) async {
    if (withDelay) {
      await Future.delayed(const Duration(seconds: 1));
    }

    loading.value = false;
  }

  @mustCallSuper
  void dispose() {
    loading.dispose();
  }
}
