import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:synclass_app/models/models.dart';

import 'package:synclass_app/providers/login_provider.dart';
import 'package:synclass_app/services/auth_service.dart';

class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({super.key});

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {

  @override
  Widget build(BuildContext context) {
    final LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    final authService = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                            decoration: BoxDecoration(
                              color: const Color(0xffD9D9D9),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: FutureBuilder(
                              future: authService.readUser(),
                              builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
                                if(!snapshot.hasData) return const CircularProgressIndicator();

                                return Column(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              color: const Color(0xff7E869E).withOpacity(.25),
                                              shape: BoxShape.circle
                                            ),
                                            child: const Icon(
                                              Icons.account_circle,
                                              size: 80,
                                            ),
                                          ),
                                            
                                          const SizedBox(height: 12),
                                            
                                          const Text(
                                            'Perfil',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                            
                                          const SizedBox(height: 40),
                                            
                                          Row(
                                            children: [
                                              const Expanded(
                                                child: Text(
                                                  'Nombre',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            
                                              const SizedBox(width: 20),
                                            
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade100,
                                                    borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  child: Text(
                                                    snapshot.data!.name,
                                                  ),
                                                )
                                              )
                                            ],
                                          ),
                                            
                                          const SizedBox(height: 12),
                                            
                                          Row(
                                            children: [
                                              const Expanded(
                                                child: Text(
                                                  'Correo',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                            
                                              const SizedBox(width: 20),
                                            
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade100,
                                                    borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  child: Text(
                                                    snapshot.data!.email!,
                                                  ),
                                                )
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                      
                                    TextButton(
                                      onPressed: () {
                                        loginProvider.logout();

                                        ScaffoldMessenger.of(context).removeCurrentSnackBar();

                                        if(context.mounted) Navigator.of(context, rootNavigator: true).pushReplacementNamed('login');
                                      },
                                      child: const Text(
                                        'Cerrar Sesión',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff5271FF)
                                        ),
                                      )
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        )
      ),
   );
  }
}