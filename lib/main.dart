import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:synclass_app/providers/providers.dart';

import 'package:synclass_app/router/router.dart';
import 'package:synclass_app/screens/screens.dart';
import 'package:synclass_app/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => GroupProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SynClass App',
        home: const GroupScreen(),
        routes: routes,
        theme: theme
      ),
    );
  }
}
