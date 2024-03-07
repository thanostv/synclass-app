import 'package:flutter/material.dart';

import 'package:synclass_app/widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Título Registrate
              const Text(
                '¡Regístrate!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              FormContainerWidget(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Nombre completo',
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Correo',
                    ),
                  ),

                  const SizedBox(height: 20),
                
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Contraseña',
                    ),
                  ),

                  const SizedBox(height: 20),

                  GestureDetector(
                    onTap: () {
                      checked = !checked;
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(value: checked, onChanged: (value) {
                          checked = !checked;
                          setState(() {});
                        }),
                        const Text(
                          'Acepto términos y condiciones',
                          style: TextStyle(
                            color: Color(0xff0A14FC)
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'section');
                      // Navigator.pushNamedAndRemoveUntil(context, 'section', (route) => false);
                    },
                    style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(0),
                    ),
                    child: const Text('Continuar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
   );
  }
}