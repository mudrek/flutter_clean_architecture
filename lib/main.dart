import 'package:flutter/material.dart';

import 'features/login/presentation/login_page/login_page.dart';
import 'injectors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CleanNext(),
    );
  }
}

class CleanNext extends StatefulWidget {
  const CleanNext({super.key});

  @override
  State<CleanNext> createState() => _CleanNextState();
}

class _CleanNextState extends State<CleanNext> {
  @override
  void initState() {
    super.initState();
    _configApp();
  }

  Future<void> _configApp() async {
    await ReleaseInjectors().inject();

    setState(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
