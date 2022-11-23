import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_next/core/data/handlers/clean_next_exception_handler.dart';
import 'package:flutter_clean_next/features/login/data/datasources/login_datasource_interface.dart';
import 'package:flutter_clean_next/features/login/data/handlers/login_exception_handler.dart';
import 'package:flutter_clean_next/features/login/domain/repositories/login_repository_interface.dart';
import 'package:flutter_clean_next/features/movies/data/datasources/movies_datasource_interface.dart';
import 'package:flutter_clean_next/features/movies/domain/repositories/movies_repository_interface.dart';
import 'package:flutter_clean_next/features/movies/domain/usecases/get_movies_usecase.dart';
import 'package:flutter_clean_next/features/movies/presentation/movies_page/viewmodels/movies_view_model.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    MoviesRepositoryInterface,
    MoviesDatasourceInterface,
    CleanNextExceptionHandler,
    GetMoviesUsecaseInterface,
    Dio,
    MoviesViewModel,
    LoginRepositoryInterface,
    LoginExceptionHandler,
    LoginDatasourceInterface,
  ],
  customMocks: [
    MockSpec<NavigatorObserver>(
      onMissingStub: OnMissingStub.returnDefault,
    ),
  ],
)
void main() {}
