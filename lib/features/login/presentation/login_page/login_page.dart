import 'package:flutter/material.dart';

import '../../../../core/foundation/injector/get.dart';
import '../../../../core/foundation/states/view_state_builder_dialog.dart';
import '../../domain/entities/login_request.dart';
import 'viewmodel/login_view_model.dart';
import 'widgets/button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginViewModel viewModel = get();

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
            TextField(
              key: const Key('textfield-login'),
              controller: _loginController,
              decoration: const InputDecoration(label: Text('Login')),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              key: const Key('textfield-password'),
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(label: Text('Password')),
            ),
            const SizedBox(
              height: 32,
            ),
            ViewStateBuilderDialog(
              state: viewModel.loginViewState,
              builder: (context, state) {
                final isLoading = state.loading;
                return ButtonWidget(
                  key: const Key('button-login'),
                  text: 'Login',
                  onPressed: () {
                    final request = LoginRequest(
                      username: _loginController.text,
                      password: _passwordController.text,
                    );

                    viewModel.doLogin(request);
                  },
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
    );
  }
}

// class _SuccessDialogWidget extends StatelessWidget {
//   final String email;
//   const _SuccessDialogWidget({
//     Key? key,
//     required this.email,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text('Email: $email'),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (_) => BlocProvider(
//                     create: (context) => getIt<MoviesCubit>()..getMovies(),
//                     child: const MoviesPage(),
//                   ),
//                 ),
//               );
//             },
//             child: const Text('Ir para movies'),
//           ),
//         ],
//       ),
//     );
//   }
// }
