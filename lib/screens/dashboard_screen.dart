import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Inicio'),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Text(''),
        ),
      ),
   );
  }
}