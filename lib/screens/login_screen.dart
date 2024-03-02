import 'package:flutter/material.dart';

import 'package:synclass_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Logo
            Container(
              width: double.infinity,
              height: 220,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/SynClass_BlackLogo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Título Iniciar sesión
            const Text(
              'Iniciar sesión',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Formulario
            const LoginForm(),

            const SizedBox(height: 10),

            // No tengo cuenta
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'register'),
                child: const Text(
                  'No tengo cuenta',
                  style: TextStyle(
                    color: Color(0xff0A14FC)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FormContainerWidget(
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'Correo',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'Contraseña',
          ),
        ),
    
        const SizedBox(height: 10),
    
        SizedBox(
          width: double.infinity,
          child: GestureDetector(
            onTap: () {
              
            },
            child: const Text(
              'Olvidé mi contraseña',
              style: TextStyle(
                color: Color(0xff0A14FC)
              ),
              textAlign: TextAlign.end
            ),
          ),
        ),
    
        const SizedBox(height: 20),
    
        ElevatedButton(
          onPressed: () {},
          style: const ButtonStyle(
            elevation: MaterialStatePropertyAll(5),
            side: MaterialStatePropertyAll(
              BorderSide(color: Colors.black)
            )
          ),
          child: const Text('Comenzar'),
        ),
      ],
    );
  }
}
