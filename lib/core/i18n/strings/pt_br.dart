import 'translations.dart';

class PtBr implements Translations {
  @override
  String get textUsernameFormFieldTitle => 'Usuário';

  @override
  String get textPasswordFormFieldTitle => 'Senha';

  @override
  String get textButtonLogin => 'Entrar';

  @override
  String get validatorMinLengthPassword =>
      'A senha deve ter no mínimo 3 caracteres';

  @override
  String get validatorMinLengthUsername =>
      'O usuário deve ter no mínimo 3 caracteres';

  @override
  String get validatorRequiredPassword => 'A senha é obrigatória';

  @override
  String get validatorRequiredUsername => 'O usuário é obrigatório';

  @override
  String get textLoginSuccess => 'Login realizado com sucesso';

  @override
  String textLoginSuccessEmail(String email) => 'Email: $email';

  @override
  String textLoginSuccessName(String name) => 'Nome: $name';

  @override
  String get textButtonLoginSuccess => 'Ir para filmes';

  @override
  String get textMoviesList => 'Lista de filmes';

  @override
  String get textGenericFailureMessage =>
      'Ocorrou um erro, favor tente novamente mais tarde';

  @override
  String get textOverview => 'Sem visão geral';

  @override
  String get textRating => 'Avaliação:';
}
