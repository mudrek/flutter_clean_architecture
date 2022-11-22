import 'dart:ui';

import 'package:flutter_clean_next/core/i18n/i18n.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return strings in language pt_BR', () {
    I18n.load(const Locale('pt_BR'));

    expect(I18n.strings.textUsernameFormFieldTitle, 'Usuário');
    expect(I18n.strings.textPasswordFormFieldTitle, 'Senha');
    expect(I18n.strings.textButtonLogin, 'Entrar');
    expect(
      I18n.strings.validatorMinLengthPassword,
      'A senha deve ter no mínimo 3 caracteres',
    );
    expect(
      I18n.strings.validatorMinLengthUsername,
      'O usuário deve ter no mínimo 3 caracteres',
    );
    expect(I18n.strings.validatorRequiredPassword, 'A senha é obrigatória');
    expect(I18n.strings.validatorRequiredUsername, 'O usuário é obrigatório');
    expect(I18n.strings.textLoginSuccess, 'Login realizado com sucesso');
    expect(
      I18n.strings.textLoginSuccessEmail('email'),
      'Email: email',
    );
    expect(
      I18n.strings.textLoginSuccessName('name'),
      'Nome: name',
    );
    expect(I18n.strings.textButtonLoginSuccess, 'Ir para filmes');
    expect(I18n.strings.textMoviesList, 'Lista de filmes');
    expect(
      I18n.strings.textGenericFailureMessage,
      'Ocorrou um erro, favor tente novamente mais tarde',
    );
    expect(I18n.strings.textOverview, 'Sem visão geral');
    expect(I18n.strings.textRating, 'Avaliação:');
  });
}
