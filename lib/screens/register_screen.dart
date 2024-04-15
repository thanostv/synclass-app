import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:synclass_app/models/models.dart';

import 'package:synclass_app/providers/providers.dart';
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
    final registerProvider = Provider.of<RegisterProvider>(context);

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
                formKey: registerProvider.formKey,
                children: [
                  TextFormField(
                    controller: registerProvider.nameTextCtrl,
                    decoration: const InputDecoration(
                      hintText: 'Nombre completo',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El campo Nombre Completo es obligatorio';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: registerProvider.emailTextCtrl,
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

                  const SizedBox(height: 20),
                
                  TextFormField(
                    controller: registerProvider.passwordTextCtrl,
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

                  const SizedBox(height: 20),

                  DropdownButtonFormField(
                    hint: const Text('Rol'),
                    value: registerProvider.rol,
                    items: const [
                      DropdownMenuItem(
                        value: 4,
                        child: Text('Padre'),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Text('Profesor'),
                      ),
                    ],
                    onChanged: (value) {
                      registerProvider.rol = value;
                    },
                    validator: (value) {
                      if(value == null) return 'Selecciona un Rol';

                      return null;
                    },
                  ),

                  GestureDetector(
                    onTap: () {
                      checked = !checked;
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CheckboxFormField(
                            initialValue: false,
                            onSaved: (newValue) {
                              registerProvider.conditions = newValue ?? false;
                            },
                            title: const Text('Acepto términos y condiciones', style: TextStyle(fontSize: 14)),
                            validator: (value) {
                              if(value ?? true) return null;
                              
                              return 'Acepta los términos y condiciones';
                            },
                          )
                        ),
                      ],
                    ),
                  ),

                  // const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () async {
                      if(registerProvider.validateRegister()) {
                        final registerResponse = await registerProvider.register();

                        if(context.mounted) {
                          if(registerResponse['status'] == true) {
                            final User user = registerResponse['data'];

                            if(user.teacherId != null) {
                              Navigator.pushNamedAndRemoveUntil(context, 'group', (route) => false);
                            }

                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('!Bienvenido!'),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(registerResponse['message']),
                            ));
                          }
                        }
                      }

                      // Navigator.pushNamed(context, 'section');
                      // 
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

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField(
    {super.key, Widget? title,
    FormFieldSetter<bool>? onSaved,
    FormFieldValidator<bool>? validator,
    bool initialValue = false,
    bool autovalidate = false})
    : super(
      onSaved: onSaved,
      validator: validator,
      initialValue: initialValue,
      builder: (FormFieldState<bool> state) {
        return CheckboxListTile(
          dense: state.hasError,
          title: title,
          value: state.value,
          onChanged: state.didChange,
          subtitle: state.hasError
              ? Builder(
                  builder: (BuildContext context) => Text(
                    state.errorText ?? "",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.error),
                  ),
                )
              : null,
          controlAffinity: ListTileControlAffinity.leading,
        );
      });
}