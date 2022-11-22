import 'package:flutter_clean_next/core/i18n/i18n.dart';
import 'package:flutter_clean_next/features/login/domain/validators/login_validators_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('passwordValidator', () {
    final validator = LoginValidatorsImpl();

    final validatorPassword = validator.passwordValidator()?.call('');
    expect(validatorPassword, I18n.strings.validatorRequiredPassword);

    final validatorPassword2 = validator.passwordValidator()?.call('12');
    expect(validatorPassword2, I18n.strings.validatorMinLengthPassword);
  });

  test('usernameValidator', () {
    final validator = LoginValidatorsImpl();

    final validatorUsername = validator.usernameValidator()?.call('');
    expect(validatorUsername, I18n.strings.validatorRequiredUsername);

    final validatorPass2 = validator.usernameValidator()?.call('us');
    expect(validatorPass2, I18n.strings.validatorMinLengthUsername);
  });
}
