import '../../foundation/data/failure.dart';
import '../../foundation/exception_handler/base_exception_handler.dart';

class CleanNextExceptionHandler implements BaseExceptionHandler {
  @override
  Failure handle(Object e) {
    return const Failure(
      title: 'Erro genérico',
      message: 'Mensagem erro genérico',
    );
  }
}
