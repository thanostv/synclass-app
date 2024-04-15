import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:synclass_app/providers/login_provider.dart';

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
    final loginProvider = Provider.of<LoginProvider>(context);

    return FormContainerWidget(
      formKey: loginProvider.formKey,
      children: [
        TextFormField(
          controller: loginProvider.emailTextCtrl,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'Correo',
          ),
          validator: (value) {
            final email = value?.trim().toLowerCase() ?? '';

            if (value == null || value.isEmpty) {
              return 'El campo Correo es obligatorio';
            }

            final bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(email);

            if (!emailValid) {
              return 'El correo es inválido';
            }

            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: loginProvider.passwordTextCtrl,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'Contraseña',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'El campo Contraseña es obligatorio';
            }

            return null;
          },
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
          onPressed: () async {
            if(loginProvider.validateLogin()) {
              final loginResponse = await loginProvider.login();

              if(context.mounted) {
                if(loginResponse['status'] == true) {
                  Navigator.pushReplacementNamed(context, 'tabs');

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('!Bienvenido!'),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(loginResponse['message']),
                  ));
                }
              }
            }
          },
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
