import 'package:flutter/material.dart';

import 'package:synclass_app/screens/screens.dart';
import 'package:synclass_app/services/auth_service.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return Scaffold(
      body: FutureBuilder(
        future: authService.readToken(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if(!snapshot.hasData) return const Center(child: Text('Espere...'));

          return snapshot.data == ''
            ? const LoginScreen()
            : const TabsScreen();
        },
      ),
   );
  }
}