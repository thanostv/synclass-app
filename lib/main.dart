import 'package:flutter/material.dart';

import 'package:synclass_app/router/router.dart';
import 'package:synclass_app/screens/screens.dart';
import 'package:synclass_app/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SynClass App',
      home: const LoginScreen(),
      routes: routes,
      theme: theme
    );
  }
}
