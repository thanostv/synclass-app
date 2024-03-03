import 'dart:io';

import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

class MagicCodeScreen extends StatefulWidget {
  const MagicCodeScreen({super.key});

  @override
  State<MagicCodeScreen> createState() => _MagicCodeScreenState();
}

class _MagicCodeScreenState extends State<MagicCodeScreen> {

  final firstCtrl   = TextEditingController();
  final secondCtrl  = TextEditingController();
  final thirdCtrl   = TextEditingController();
  final fourthCtrl  = TextEditingController();

  @override
  void initState() {
    super.initState();
    
    firstCtrl.addListener(()  => onSelection(firstCtrl));
    secondCtrl.addListener(() => onSelection(secondCtrl));
    thirdCtrl.addListener(()  => onSelection(thirdCtrl));
    fourthCtrl.addListener(() => onSelection(fourthCtrl));
  }

  @override
  void dispose() {
    super.dispose();

    firstCtrl.dispose();
    secondCtrl.dispose();
    thirdCtrl.dispose();
    fourthCtrl.dispose();
  }

  void onSelection(TextEditingController ctrl) {
    if(FocusScope.of(context).hasFocus) {
      ctrl.selection = TextSelection.fromPosition(
        TextPosition(offset: ctrl.text.length),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: FocusNode(),
      onKeyEvent: (value) {
        if(Platform.isAndroid) {
          if(value is KeyDownEvent && value.logicalKey.keyLabel == 'Backspace') {
            FocusScope.of(context).previousFocus();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 20),
            
                // Título Únete al grupo
                const Text(
                  '¡Únete al grupo!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
      
                const SizedBox(height: 10),
      
                // Título Únete al grupo
                const Text(
                  'Ingresa el código mágico',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
      
                const SizedBox(height: 14),
      
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _CodeWidget(textCtrl: firstCtrl),
                      _CodeWidget(textCtrl: secondCtrl),
                      _CodeWidget(textCtrl: thirdCtrl),
                      _CodeWidget(textCtrl: fourthCtrl),
                    ],
                  ),
                ),
      
                const SizedBox(height: 30),
      
                const Text(
                  'No tengo código mágico',
                  style: TextStyle(
                    color: Color(0xff0A14FC)
                  ),
                ),
      
                const SizedBox(height: 30),
      
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, 'dashboard', (route) => false);
                  },
                  style: const ButtonStyle(
                    elevation: MaterialStatePropertyAll(0),
                  ),
                  child: const Text('Continuar'),
                ),
              ],
            ),
          ),
        )
         ),
    );
  }
}



class _CodeWidget extends StatelessWidget {
  final TextEditingController textCtrl;
  
  const _CodeWidget({required this.textCtrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 60,
      child: TextField(
        minLines: null,
        maxLines: null,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly
        ],
        controller: textCtrl,
        expands: true,
        onChanged: (value) {
          if(value.isNotEmpty) {
            textCtrl.text = value.characters.last;
            FocusScope.of(context).nextFocus();
          }

          if(Platform.isIOS && value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}