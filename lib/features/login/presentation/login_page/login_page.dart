import 'package:flutter/material.dart';

import '../../../../core/constants/keys.dart';
import '../../../../core/foundation/form/base_form.dart';
import '../../../../core/foundation/injector/get.dart';
import '../../../../core/foundation/states/view_state_builder_dialog.dart';
import '../../../../core/i18n/i18n.dart';
import '../../domain/entities/login_request.dart';
import 'validators/login_validators_interface.dart';
import 'viewmodel/login_view_model.dart';
import 'widgets/button_widget.dart';
import 'widgets/login_alert_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with BaseForm {
  final LoginViewModel viewModel = get();
  final LoginValidatorsInterface _formValidators = get();

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(32),
                child: Image.asset(
                  'assets/images/logo_nf.png',
                  width: 120,
                  height: 120,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                key: const Key(keyTextFormFieldUsername),
                controller: _loginController,
                decoration: InputDecoration(
                  label: Text(I18n.strings.textUsernameFormFieldTitle),
                ),
                validator: _formValidators.usernameValidator(),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                key: const Key(keyTextFormFieldPassword),
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  label: Text(I18n.strings.textPasswordFormFieldTitle),
                ),
                validator: _formValidators.passwordValidator(),
              ),
              const SizedBox(
                height: 32,
              ),
              ViewStateBuilderDialog(
                state: viewModel.loginViewState,
                builder: (context, state) {
                  final value = state.value;

                  if (value != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showDialog(
                        context: context,
                        builder: (context) => LoginAlertWidget(
                          key: const Key(keyLoginAlert),
                          userInfo: value,
                        ),
                      );
                    });

                    viewModel.cleanViewState();
                  }

                  final isLoading = state.loading;
                  return ButtonWidget(
                    key: const Key(keyButtonLogin),
                    text: I18n.strings.textButtonLogin,
                    onPressed: _onClickLogin,
                    showProgress: isLoading,
                  );
                },
                onError: (failure) {
                  if (failure != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        key: const Key(keyScaffolMessage),
                        content: Text(
                          failure.message,
                        ),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onClickLogin() async {
    final request = LoginRequest(
      username: _loginController.text,
      password: _passwordController.text,
    );

    final isFormValid = formUpdate();

    if (isFormValid) {
      await viewModel.doLogin(request);
    }
  }
}
