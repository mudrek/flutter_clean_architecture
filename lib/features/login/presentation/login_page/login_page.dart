import 'package:flutter/material.dart';

import '../../../../core/foundation/form/base_form.dart';
import '../../../../core/foundation/injector/get.dart';
import '../../../../core/foundation/states/view_state_builder_dialog.dart';
import '../../../movies/presentation/movies_page/movies_page.dart';
import '../../domain/entities/login_request.dart';
import 'validators/login_validators_interface.dart';
import 'viewmodel/login_view_model.dart';
import 'widgets/button_widget.dart';

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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(32),
                child: Image.asset(
                  'assets/images/logo_nf.png',
                  key: const Key('nf-logo-image'),
                  width: 120,
                  height: 120,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                key: const Key('textfield-login'),
                controller: _loginController,
                decoration: const InputDecoration(label: Text('Login')),
                validator: _formValidators.usernameValidator(),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                key: const Key('textfield-password'),
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(label: Text('Password')),
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
                    //showDialog
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Login efetuado com sucesso!'),
                          content: SizedBox(
                            height: 130,
                            child: Center(
                              child: Column(
                                children: [
                                  Text('Nome: ${value.name}'),
                                  Text('Email: ${value.email}'),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  ButtonWidget(
                                    text: 'Ir para movies',
                                    onPressed: _onClickPushMovies,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
                  }

                  final isLoading = state.loading;
                  return ButtonWidget(
                    key: const Key('button-login'),
                    text: 'Login',
                    onPressed: _onClickLogin,
                    showProgress: isLoading,
                  );
                },
                onError: (failure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        failure?.message ?? 'Ocorreu um erro inesperado',
                      ),
                    ),
                  );
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

  void _onClickPushMovies() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const MoviesPage();
        },
      ),
    );
  }
}
