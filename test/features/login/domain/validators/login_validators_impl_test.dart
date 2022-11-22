import 'package:flutter_clean_next/core/i18n/i18n.dart';
import 'package:flutter_clean_next/features/login/domain/validators/login_validators_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LoginValidatorsImpl validator;

  setUp(() {
    validator = LoginValidatorsImpl();
  });

  group('passwordValidator', () {
    test('should return required message when string is empty', () {
      final validatorPassword = validator.passwordValidator()?.call('');
      expect(validatorPassword, I18n.strings.validatorRequiredPassword);

      final validatorPassword2 = validator.passwordValidator()?.call(null);
      expect(validatorPassword2, I18n.strings.validatorRequiredPassword);
    });

    test(
      'should return minLenght message when string is less than 3 characters',
      () {
        final validatorPassword = validator.passwordValidator()?.call('12');
        expect(validatorPassword, I18n.strings.validatorMinLengthPassword);
      },
    );
  });

  group('usernameValidator', () {
    test('should return required message when string is empty', () {
      final validatorUsername = validator.usernameValidator()?.call('');
      expect(validatorUsername, I18n.strings.validatorRequiredUsername);

      final validatorUsername2 = validator.usernameValidator()?.call(null);
      expect(validatorUsername2, I18n.strings.validatorRequiredUsername);
    });

    test(
      'should return minLenght message when string is less than 3 characters',
      () {
        final validatorUsername = validator.usernameValidator()?.call('12');
        expect(validatorUsername, I18n.strings.validatorMinLengthUsername);
      },
    );
  });
}
