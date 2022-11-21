import '../data/failure.dart';

abstract class ViewContract<T> {
  void onError(Failure? failure);
  void onSuccess({T? success});
}
