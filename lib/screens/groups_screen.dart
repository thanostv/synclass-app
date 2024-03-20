import 'package:flutter/material.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grupos'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 20),
                
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Ver Todos',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff5271FF)
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  decoration: BoxDecoration(
                    color: const Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Inglés',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),

                                Text(
                                  '¡Pendiente asistencia!',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff5271FF)
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Icon(Icons.list_alt_outlined),
                                SizedBox(width: 12),
                                Icon(Icons.edit),
                              ],
                            )
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'Horario',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration:  BoxDecoration(
                              color: const Color(0xff585151).withOpacity(.53),
                              shape: BoxShape.circle
                            ),
                            child: const Text('Lu')
                          ),

                          const Text('Ma'),
                          const Text('Mi'),
                          const Text('Ju'),
                          const Text('Vi'),
                          const Text('Sa'),
                          const Text('Do'),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Inglés',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),

                                Text(
                                  '',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff5271FF)
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                // Icon(Icons.list_alt_outlined),
                                SizedBox(width: 12),
                                Icon(Icons.edit),
                              ],
                            )
                          ],
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