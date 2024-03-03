import 'package:flutter/material.dart';

class SectionScreen extends StatelessWidget {
  const SectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
        
            // Título Cómo usaras la app
            const SizedBox(
              width: double.infinity,
              child: Text(
                '¿Cómo usaras la app?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: 140,
              child: ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(0),
                ),
                child: const Text('Profesor'),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 140,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'magic-code');
                },
                style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(0),
                ),
                child: const Text('Padre'),
              ),
            ),
          ],
        ),
      )
   );
  }
}