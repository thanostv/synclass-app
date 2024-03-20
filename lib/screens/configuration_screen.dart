import 'package:flutter/material.dart';

class ConfigurationScreen extends StatelessWidget {
  const ConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alertas'),
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
                            child: Column(
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
                                        
                                      const Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Correo',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                        
                                          SizedBox(width: 20),
                                        
                                          Expanded(
                                            flex: 2,
                                            child: TextField(
                                              readOnly: true,
                                            )
                                          )
                                        ],
                                      ),
                                        
                                      const SizedBox(height: 12),
                                        
                                      const Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Contraseña',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                        
                                          SizedBox(width: 20),
                                        
                                          Expanded(
                                            flex: 2,
                                            child: TextField(
                                              readOnly: true,
                                            )
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                  
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Cerrar Sesión',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff5271FF)
                                    ),
                                  )
                                )
                              ],
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