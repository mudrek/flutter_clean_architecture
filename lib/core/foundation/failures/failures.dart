import '../data/failure.dart';

class GenericFailure extends Failure {}

class TimeoutFailure extends Failure {
  const TimeoutFailure({
    String? message,
  }) : super(
          message: message ?? 'Você está sem internet, tente novamente.',
        );
}

class PlatformFailure extends Failure {
  const PlatformFailure({
    String? message,
  }) : super(
          message: message ?? 'Aconteceu um erro inesperado no aplicativo.',
        );
}

class ServiceFailure extends Failure {
  final String code;

  const ServiceFailure({
    String? message,
    required this.code,
  }) : super(
          message: message ??
              'Ocorreu um erro inesperado no servidor, tente novamente.',
        );
}

class MessageFailure extends Failure {
  final String msg;

  const MessageFailure(this.msg);
}
