import 'package:flutter/material.dart';
import 'package:synclass_app/screens/screens.dart';


class MagicCodeTeacherScreen extends StatefulWidget {

  const MagicCodeTeacherScreen({super.key});

  @override
  State<MagicCodeTeacherScreen> createState() => _MagicCodeTeacherScreenState();
}

class _MagicCodeTeacherScreenState extends State<MagicCodeTeacherScreen> {
  
  final firstCtrl   = TextEditingController();
  final secondCtrl  = TextEditingController();
  final thirdCtrl   = TextEditingController();
  final fourthCtrl  = TextEditingController();

  final readOnly = true;

  @override
  void initState() {
    firstCtrl.text  = '2';
    secondCtrl.text = '1';
    thirdCtrl.text  = '8';
    fourthCtrl.text = '3';

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    firstCtrl.dispose();
    secondCtrl.dispose();
    thirdCtrl.dispose();
    fourthCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 20),
            
            // Título Únete al grupo
            const Text(
              '¡Comparte tu código mágico!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),
  
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CodeWidget(textCtrl: firstCtrl, readOnly: readOnly),
                  CodeWidget(textCtrl: secondCtrl, readOnly: readOnly),
                  CodeWidget(textCtrl: thirdCtrl, readOnly: readOnly),
                  CodeWidget(textCtrl: fourthCtrl, readOnly: readOnly),
                ],
              ),
            ),

            const SizedBox(height: 30),
  
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'dashboard');
                // Navigator.pushNamedAndRemoveUntil(context, 'dashboard', (route) => false);
              },
              style: const ButtonStyle(
                elevation: MaterialStatePropertyAll(0),
              ),
              child: const Text('Continuar'),
            ),
          ],
        ),
      ),
   );
  }
}