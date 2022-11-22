// Mocks generated by Mockito 5.3.2 from annotations
// in flutter_clean_next/test/mocks/mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i12;

import 'package:dio/src/adapter.dart' as _i5;
import 'package:dio/src/cancel_token.dart' as _i18;
import 'package:dio/src/dio.dart' as _i17;
import 'package:dio/src/dio_mixin.dart' as _i7;
import 'package:dio/src/options.dart' as _i4;
import 'package:dio/src/response.dart' as _i8;
import 'package:dio/src/transformer.dart' as _i6;
import 'package:flutter/src/widgets/navigator.dart' as _i23;
import 'package:flutter_clean_next/core/data/handlers/clean_next_exception_handler.dart'
    as _i16;
import 'package:flutter_clean_next/core/foundation/data/failure.dart' as _i3;
import 'package:flutter_clean_next/core/foundation/data/result.dart' as _i2;
import 'package:flutter_clean_next/core/foundation/states/state.dart' as _i10;
import 'package:flutter_clean_next/features/login/domain/entities/login_request.dart'
    as _i22;
import 'package:flutter_clean_next/features/login/domain/entities/user_info.dart'
    as _i21;
import 'package:flutter_clean_next/features/login/domain/repositories/login_repository_interface.dart'
    as _i20;
import 'package:flutter_clean_next/features/movies/data/datasources/movies_datasource_interface.dart'
    as _i14;
import 'package:flutter_clean_next/features/movies/data/models/movie_model.dart'
    as _i15;
import 'package:flutter_clean_next/features/movies/domain/entities/movie.dart'
    as _i13;
import 'package:flutter_clean_next/features/movies/domain/repositories/movies_repository_interface.dart'
    as _i11;
import 'package:flutter_clean_next/features/movies/domain/usecases/get_movies_usecase.dart'
    as _i9;
import 'package:flutter_clean_next/features/movies/presentation/movies_page/viewmodels/movies_view_model.dart'
    as _i19;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResult_0<T> extends _i1.SmartFake implements _i2.Result<T> {
  _FakeResult_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFailure_1 extends _i1.SmartFake implements _i3.Failure {
  _FakeFailure_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBaseOptions_2 extends _i1.SmartFake implements _i4.BaseOptions {
  _FakeBaseOptions_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHttpClientAdapter_3 extends _i1.SmartFake
    implements _i5.HttpClientAdapter {
  _FakeHttpClientAdapter_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTransformer_4 extends _i1.SmartFake implements _i6.Transformer {
  _FakeTransformer_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeInterceptors_5 extends _i1.SmartFake implements _i7.Interceptors {
  _FakeInterceptors_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_6<T> extends _i1.SmartFake implements _i8.Response<T> {
  _FakeResponse_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetMoviesUsecaseInterface_7 extends _i1.SmartFake
    implements _i9.GetMoviesUsecaseInterface {
  _FakeGetMoviesUsecaseInterface_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeViewState_8<T> extends _i1.SmartFake implements _i10.ViewState<T> {
  _FakeViewState_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MoviesRepositoryInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockMoviesRepositoryInterface extends _i1.Mock
    implements _i11.MoviesRepositoryInterface {
  MockMoviesRepositoryInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.Future<_i2.Result<List<_i13.Movie>>> getMovies() => (super.noSuchMethod(
        Invocation.method(
          #getMovies,
          [],
        ),
        returnValue: _i12.Future<_i2.Result<List<_i13.Movie>>>.value(
            _FakeResult_0<List<_i13.Movie>>(
          this,
          Invocation.method(
            #getMovies,
            [],
          ),
        )),
      ) as _i12.Future<_i2.Result<List<_i13.Movie>>>);
}

/// A class which mocks [MoviesDatasourceInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockMoviesDatasourceInterface extends _i1.Mock
    implements _i14.MoviesDatasourceInterface {
  MockMoviesDatasourceInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.Future<List<_i15.MovieModel>> getMovies() => (super.noSuchMethod(
        Invocation.method(
          #getMovies,
          [],
        ),
        returnValue:
            _i12.Future<List<_i15.MovieModel>>.value(<_i15.MovieModel>[]),
      ) as _i12.Future<List<_i15.MovieModel>>);
}

/// A class which mocks [CleanNextExceptionHandler].
///
/// See the documentation for Mockito's code generation for more information.
class MockCleanNextExceptionHandler extends _i1.Mock
    implements _i16.CleanNextExceptionHandler {
  MockCleanNextExceptionHandler() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Failure handle(Object? e) => (super.noSuchMethod(
        Invocation.method(
          #handle,
          [e],
        ),
        returnValue: _FakeFailure_1(
          this,
          Invocation.method(
            #handle,
            [e],
          ),
        ),
      ) as _i3.Failure);
}

/// A class which mocks [GetMoviesUsecaseInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetMoviesUsecaseInterface extends _i1.Mock
    implements _i9.GetMoviesUsecaseInterface {
  MockGetMoviesUsecaseInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.Future<_i2.Result<List<_i13.Movie>>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i12.Future<_i2.Result<List<_i13.Movie>>>.value(
            _FakeResult_0<List<_i13.Movie>>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i12.Future<_i2.Result<List<_i13.Movie>>>);
}

/// A class which mocks [Dio].
///
/// See the documentation for Mockito's code generation for more information.
class MockDio extends _i1.Mock implements _i17.Dio {
  MockDio() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.BaseOptions get options => (super.noSuchMethod(
        Invocation.getter(#options),
        returnValue: _FakeBaseOptions_2(
          this,
          Invocation.getter(#options),
        ),
      ) as _i4.BaseOptions);
  @override
  set options(_i4.BaseOptions? _options) => super.noSuchMethod(
        Invocation.setter(
          #options,
          _options,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.HttpClientAdapter get httpClientAdapter => (super.noSuchMethod(
        Invocation.getter(#httpClientAdapter),
        returnValue: _FakeHttpClientAdapter_3(
          this,
          Invocation.getter(#httpClientAdapter),
        ),
      ) as _i5.HttpClientAdapter);
  @override
  set httpClientAdapter(_i5.HttpClientAdapter? _httpClientAdapter) =>
      super.noSuchMethod(
        Invocation.setter(
          #httpClientAdapter,
          _httpClientAdapter,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Transformer get transformer => (super.noSuchMethod(
        Invocation.getter(#transformer),
        returnValue: _FakeTransformer_4(
          this,
          Invocation.getter(#transformer),
        ),
      ) as _i6.Transformer);
  @override
  set transformer(_i6.Transformer? _transformer) => super.noSuchMethod(
        Invocation.setter(
          #transformer,
          _transformer,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Interceptors get interceptors => (super.noSuchMethod(
        Invocation.getter(#interceptors),
        returnValue: _FakeInterceptors_5(
          this,
          Invocation.getter(#interceptors),
        ),
      ) as _i7.Interceptors);
  @override
  void close({bool? force = false}) => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
          {#force: force},
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i12.Future<_i8.Response<T>> get<T>(
    String? path, {
    Map<String, dynamic>? queryParameters,
    _i4.Options? options,
    _i18.CancelToken? cancelToken,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [path],
          {
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i12.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #get,
            [path],
            {
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i12.Future<_i8.Response<T>>);
  @override
  _i12.Future<_i8.Response<T>> getUri<T>(
    Uri? uri, {
    _i4.Options? options,
    _i18.CancelToken? cancelToken,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUri,
          [uri],
          {
            #options: options,
            #cancelToken: cancelToken,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i12.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #getUri,
            [uri],
            {
              #options: options,
              #cancelToken: cancelToken,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i12.Future<_i8.Response<T>>);
  @override
  _i12.Future<_i8.Response<T>> post<T>(
    String? path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    _i4.Options? options,
    _i18.CancelToken? cancelToken,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i12.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #post,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i12.Future<_i8.Response<T>>);
  @override
  _i12.Future<_i8.Response<T>> postUri<T>(
    Uri? uri, {
    dynamic data,
    _i4.Options? options,
    _i18.CancelToken? cancelToken,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #postUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i12.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #postUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i12.Future<_i8.Response<T>>);
  @override
  _i12.Future<_i8.Response<T>> put<T>(
    String? path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    _i4.Options? options,
    _i18.CancelToken? cancelToken,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i12.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #put,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i12.Future<_i8.Response<T>>);
  @override
  _i12.Future<_i8.Response<T>> putUri<T>(
    Uri? uri, {
    dynamic data,
    _i4.Options? options,
    _i18.CancelToken? cancelToken,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #putUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i12.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #putUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i12.Future<_i8.Response<T>>);
  @override
  _i12.Future<_i8.Response<T>> head<T>(
    String? path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    _i4.Options? options,
    _i18.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i12.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #head,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i12.Future<_i8.Response<T>>);
  @override
  _i12.Future<_i8.Response<T>> headUri<T>(
    Uri? uri, {
    dynamic data,
    _i4.Options? options,
    _i18.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #headUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i12.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #headUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i12.Future<_i8.Response<T>>);
  @override
  _i12.Future<_i8.Response<T>> delete<T>(
    String? path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    _i4.Options? options,
    _i18.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i12.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #delete,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i12.Future<_i8.Response<T>>);
  @override
  _i12.Future<_i8.Response<T>> deleteUri<T>(
    Uri? uri, {
    dynamic data,
    _i4.Options? options,
    _i18.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i12.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #deleteUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i12.Future<_i8.Response<T>>);
  @override
  _i12.Future<_i8.Response<T>> patch<T>(
    String? path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    _i4.Options? options,
    _i18.CancelToken? cancelToken,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i12.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #patch,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i12.Future<_i8.Response<T>>);
  @override
  _i12.Future<_i8.Response<T>> patchUri<T>(
    Uri? uri, {
    dynamic data,
    _i4.Options? options,
    _i18.CancelToken? cancelToken,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patchUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i12.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #patchUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i12.Future<_i8.Response<T>>);
  @override
  void lock() => super.noSuchMethod(
        Invocation.method(
          #lock,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void unlock() => super.noSuchMethod(
        Invocation.method(
          #unlock,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void clear() => super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i12.Future<_i8.Response<dynamic>> download(
    String? urlPath,
    dynamic savePath, {
    _i4.ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    _i18.CancelToken? cancelToken,
    bool? deleteOnError = true,
    String? lengthHeader = r'content-length',
    dynamic data,
    _i4.Options? options,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #download,
          [
            urlPath,
            savePath,
          ],
          {
            #onReceiveProgress: onReceiveProgress,
            #queryParameters: queryParameters,
            #cancelToken: cancelToken,
            #deleteOnError: deleteOnError,
            #lengthHeader: lengthHeader,
            #data: data,
            #options: options,
          },
        ),
        returnValue:
            _i12.Future<_i8.Response<dynamic>>.value(_FakeResponse_6<dynamic>(
          this,
          Invocation.method(
            #download,
            [
              urlPath,
              savePath,
            ],
            {
              #onReceiveProgress: onReceiveProgress,
              #queryParameters: queryParameters,
              #cancelToken: cancelToken,
              #deleteOnError: deleteOnError,
              #lengthHeader: lengthHeader,
              #data: data,
              #options: options,
            },
          ),
        )),
      ) as _i12.Future<_i8.Response<dynamic>>);
  @override
  _i12.Future<_i8.Response<dynamic>> downloadUri(
    Uri? uri,
    dynamic savePath, {
    _i4.ProgressCallback? onReceiveProgress,
    _i18.CancelToken? cancelToken,
    bool? deleteOnError = true,
    String? lengthHeader = r'content-length',
    dynamic data,
    _i4.Options? options,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #downloadUri,
          [
            uri,
            savePath,
          ],
          {
            #onReceiveProgress: onReceiveProgress,
            #cancelToken: cancelToken,
            #deleteOnError: deleteOnError,
            #lengthHeader: lengthHeader,
            #data: data,
            #options: options,
          },
        ),
        returnValue:
            _i12.Future<_i8.Response<dynamic>>.value(_FakeResponse_6<dynamic>(
          this,
          Invocation.method(
            #downloadUri,
            [
              uri,
              savePath,
            ],
            {
              #onReceiveProgress: onReceiveProgress,
              #cancelToken: cancelToken,
              #deleteOnError: deleteOnError,
              #lengthHeader: lengthHeader,
              #data: data,
              #options: options,
            },
          ),
        )),
      ) as _i12.Future<_i8.Response<dynamic>>);
  @override
  _i12.Future<_i8.Response<T>> request<T>(
    String? path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    _i18.CancelToken? cancelToken,
    _i4.Options? options,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #request,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #cancelToken: cancelToken,
            #options: options,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i12.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #request,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #cancelToken: cancelToken,
              #options: options,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i12.Future<_i8.Response<T>>);
  @override
  _i12.Future<_i8.Response<T>> requestUri<T>(
    Uri? uri, {
    dynamic data,
    _i18.CancelToken? cancelToken,
    _i4.Options? options,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #requestUri,
          [uri],
          {
            #data: data,
            #cancelToken: cancelToken,
            #options: options,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i12.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #requestUri,
            [uri],
            {
              #data: data,
              #cancelToken: cancelToken,
              #options: options,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i12.Future<_i8.Response<T>>);
  @override
  _i12.Future<_i8.Response<T>> fetch<T>(_i4.RequestOptions? requestOptions) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetch,
          [requestOptions],
        ),
        returnValue: _i12.Future<_i8.Response<T>>.value(_FakeResponse_6<T>(
          this,
          Invocation.method(
            #fetch,
            [requestOptions],
          ),
        )),
      ) as _i12.Future<_i8.Response<T>>);
}

/// A class which mocks [MoviesViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockMoviesViewModel extends _i1.Mock implements _i19.MoviesViewModel {
  MockMoviesViewModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.GetMoviesUsecaseInterface get getMoviesUsecase => (super.noSuchMethod(
        Invocation.getter(#getMoviesUsecase),
        returnValue: _FakeGetMoviesUsecaseInterface_7(
          this,
          Invocation.getter(#getMoviesUsecase),
        ),
      ) as _i9.GetMoviesUsecaseInterface);
  @override
  _i10.ViewState<List<_i13.Movie>> get moviesState => (super.noSuchMethod(
        Invocation.getter(#moviesState),
        returnValue: _FakeViewState_8<List<_i13.Movie>>(
          this,
          Invocation.getter(#moviesState),
        ),
      ) as _i10.ViewState<List<_i13.Movie>>);
  @override
  _i12.Future<void> fetch() => (super.noSuchMethod(
        Invocation.method(
          #fetch,
          [],
        ),
        returnValue: _i12.Future<void>.value(),
        returnValueForMissingStub: _i12.Future<void>.value(),
      ) as _i12.Future<void>);
}

/// A class which mocks [LoginRepositoryInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginRepositoryInterface extends _i1.Mock
    implements _i20.LoginRepositoryInterface {
  MockLoginRepositoryInterface() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.Future<_i2.Result<_i21.UserInfo>> doLogin(
          {required _i22.LoginRequest? loginRequest}) =>
      (super.noSuchMethod(
        Invocation.method(
          #doLogin,
          [],
          {#loginRequest: loginRequest},
        ),
        returnValue: _i12.Future<_i2.Result<_i21.UserInfo>>.value(
            _FakeResult_0<_i21.UserInfo>(
          this,
          Invocation.method(
            #doLogin,
            [],
            {#loginRequest: loginRequest},
          ),
        )),
      ) as _i12.Future<_i2.Result<_i21.UserInfo>>);
}

/// A class which mocks [NavigatorObserver].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigatorObserver extends _i1.Mock implements _i23.NavigatorObserver {
  @override
  void didPush(
    _i23.Route<dynamic>? route,
    _i23.Route<dynamic>? previousRoute,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #didPush,
          [
            route,
            previousRoute,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void didPop(
    _i23.Route<dynamic>? route,
    _i23.Route<dynamic>? previousRoute,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #didPop,
          [
            route,
            previousRoute,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void didRemove(
    _i23.Route<dynamic>? route,
    _i23.Route<dynamic>? previousRoute,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #didRemove,
          [
            route,
            previousRoute,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void didReplace({
    _i23.Route<dynamic>? newRoute,
    _i23.Route<dynamic>? oldRoute,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #didReplace,
          [],
          {
            #newRoute: newRoute,
            #oldRoute: oldRoute,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  void didStartUserGesture(
    _i23.Route<dynamic>? route,
    _i23.Route<dynamic>? previousRoute,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #didStartUserGesture,
          [
            route,
            previousRoute,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void didStopUserGesture() => super.noSuchMethod(
        Invocation.method(
          #didStopUserGesture,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
