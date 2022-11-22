import 'package:dio/dio.dart';
import 'package:flutter_clean_next/core/data/handlers/clean_next_exception_handler.dart';
import 'package:flutter_clean_next/features/movies/data/datasources/movies_datasource_interface.dart';
import 'package:flutter_clean_next/features/movies/domain/repositories/movies_repository_interface.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  MoviesRepositoryInterface,
  MoviesDatasourceInterface,
  CleanNextExceptionHandler,
  Dio,
])
void main() {}
