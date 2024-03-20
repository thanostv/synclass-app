import 'package:flutter/material.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alertas'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                
                const Text(
                  'Hoy',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),

                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Examen Tema 1',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),

                      Text(
                        'Grupo Inglés',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black38
                        ),
                      ),

                      SizedBox(height: 4),

                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Publicado Hoy 11:34 am',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black26
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                
                const Text(
                  'Pasadas',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Anuncio Inicio de clase',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),

                      Text(
                        'Grupo Inglés',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black38
                        ),
                      ),

                      SizedBox(height: 4),

                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Publicado 03/03/2024',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black26
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        backgroundColor: const Color(0xff585151).withOpacity(.53),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100)
        ),
        child: const Icon(Icons.add),
      ),
   );
  }
}