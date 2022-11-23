import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_next/core/foundation/exception_handler/base_exception_handler.dart';
import 'package:flutter_clean_next/features/login/data/datasources/login_datasource_interface.dart';
import 'package:flutter_clean_next/features/login/data/handlers/login_exception_handler.dart';
import 'package:flutter_clean_next/features/login/domain/repositories/login_repository_interface.dart';
import 'package:flutter_clean_next/features/login/domain/usecases/do_login_usecase.dart';
import 'package:flutter_clean_next/features/login/presentation/login_page/viewmodel/login_view_model.dart';
import 'package:flutter_clean_next/features/movies/data/datasources/movies_datasource_interface.dart';
import 'package:flutter_clean_next/features/movies/data/handlers/movies_exception_handler.dart';
import 'package:flutter_clean_next/features/movies/domain/repositories/movies_repository_interface.dart';
import 'package:flutter_clean_next/features/movies/domain/usecases/get_movies_usecase.dart';
import 'package:flutter_clean_next/features/movies/presentation/movies_page/viewmodels/movies_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class MockFunction<I, O> extends Mock {
  O call(I? param);
}

@GenerateMocks(
  [
    MoviesRepositoryInterface,
    MoviesDatasourceInterface,
    GetMoviesUsecaseInterface,
    Dio,
    MoviesViewModel,
    LoginRepositoryInterface,
    MoviesExceptionHandler,
    LoginExceptionHandler,
    LoginDatasourceInterface,
    BaseExceptionHandler,
    LoginViewModel,
    DoLoginUsecaseInterface,
  ],
  customMocks: [
    MockSpec<NavigatorObserver>(
      onMissingStub: OnMissingStub.returnDefault,
    ),
  ],
)
void main() {}
