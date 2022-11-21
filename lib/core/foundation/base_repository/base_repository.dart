import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/failure.dart';
import '../data/result.dart';
import '../exception_handler/base_exception_handler.dart';
import '../failures/failures.dart';

typedef Task<T> = Future<T> Function();

abstract class BaseRepository<EH extends BaseExceptionHandler> {
  final EH? exceptionHandler;

  const BaseRepository({this.exceptionHandler});

  Future<Result<T>> exec<T>(
    Task<T> task,
  ) async {
    try {
      T result = await task();

      return Result.success(result);
    } catch (e) {
      debugPrint('###### Exception: $e');

      try {
        final Failure? failure = exceptionHandler?.handle(e);
        if (failure != null) {
          return Result.failure(failure);
        } else {
          rethrow;
        }
      } on PlatformException catch (e) {
        return Result.failure(
          PlatformFailure(
            message: e.message,
          ),
        );
      } catch (e) {
        return Result.failure(GenericFailure());
      }
    }
  }
}
