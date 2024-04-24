import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:synclass_app/models/models.dart';

import 'package:synclass_app/providers/providers.dart';
import 'package:synclass_app/screens/screens.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {

  final days = {
    1: 'Lu',
    2: 'Ma',
    3: 'Mi',
    4: 'Ju',
    5: 'Vi',
    6: 'Sa',
    7: 'Do',
  };

  late List<bool> actives = List.generate(days.length + 1, (i) => false);

  @override
  Widget build(BuildContext context) {
    final groupsProvider = Provider.of<GroupsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grupos'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
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

                      FutureBuilder(
                        future: groupsProvider.todaysTeacherGroup(),
                        builder: (BuildContext context, AsyncSnapshot<List<Group>> snapshot) {
                          if(!snapshot.hasData) return const Center(child: CircularProgressIndicator());

                          final groups = snapshot.data;

                          if(groups!.isEmpty) return const Center(child: Text('No hay materias disponibles el día de hoy'));

                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: groups.length,
                            itemBuilder: (BuildContext context, int index) {
                              final group = groups[index];

                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                                margin: const EdgeInsets.only(bottom: 10),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          group.name,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),

                                        if(group.attended == 0) const Text(
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
                                        if(group.attended == 0) IconButton(
                                          onPressed: () {
                                            PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                                                context,
                                                screen: const AttendanceListScreen(),
                                                settings: RouteSettings(arguments: {
                                                  'alumns': group.alumns,
                                                  'groupId': group.id
                                                }),
                                                pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                            );
                                          },
                                          icon: const Icon(Icons.list_alt_outlined),
                                        ),
                                        const SizedBox(width: 12),
                                        const Icon(Icons.edit),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
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
                        children: days.map((key, value) => MapEntry(key, GestureDetector(
                            onTap: () {
                              setState(() {
                                groupsProvider.selectedDay = key;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration:  BoxDecoration(
                                color: groupsProvider.selectedDay == key
                                  ? const Color(0xff585151).withOpacity(.53)
                                  : null,
                                shape: BoxShape.circle
                              ),
                              child: Text(value)
                            ),
                          )))
                          .values
                          .toList(),
                      ),

                      const SizedBox(height: 12),

                      FutureBuilder(
                        future: groupsProvider.myTeacherGroup(),
                        builder: (BuildContext context, AsyncSnapshot<List<Group>> snapshot) {
                          if(!snapshot.hasData) return const Center(child: CircularProgressIndicator());

                          final groups = snapshot.data;

                          if(groups!.isEmpty) return const Center(child: Text('No hay materias disponibles'));

                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: groups.length,
                            itemBuilder: (BuildContext context, int index) {
                              final group = groups[index];

                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                                margin: const EdgeInsets.only(bottom: 10),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          group.name,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),

                                    const Row(
                                      children: [
                                        SizedBox(width: 12),
                                        Icon(Icons.edit),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
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
        heroTag: 'groups',
        onPressed: () {
          PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
              context,
              screen: const GroupScreen(),
              settings: const RouteSettings(arguments: {
                'title': 'Crea tu grupo'
              }),
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
              withNavBar: false
          );
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