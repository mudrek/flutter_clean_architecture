import 'package:form_builder_validators/form_builder_validators.dart';

import '../../presentation/login_page/validators/login_validators_interface.dart';

class LoginValidatorsImpl implements LoginValidatorsInterface {
  @override
  String? Function(String? p1)? passwordValidator() {
    // TODO i18n
    return FormBuilderValidators.compose(
      [
        FormBuilderValidators.required(errorText: 'A senha é obrigatório'),
        FormBuilderValidators.minLength(
          3,
          errorText: 'A senha deve ter no mínimo 3 caracteres',
        ),
      ],
    );
  }

  @override
  String? Function(String? p1)? usernameValidator() {
    // TODO i18n
    return FormBuilderValidators.compose(
      [
        FormBuilderValidators.required(errorText: 'O login é obrigatório'),
        FormBuilderValidators.minLength(
          3,
          errorText: 'O login deve ter no mínimo 3 caracteres',
        ),
      ],
    );
  }
}
