import '../data/failure.dart';

class GenericFailure extends Failure {}

class TimeoutFailure extends Failure {
  const TimeoutFailure({
    String? message,
  }) : super(
          message: message ?? 'Você está sem internet, tente novamente.',
        );
}

class MessageFailure extends Failure {
  final String msg;

  const MessageFailure(this.msg);
}
