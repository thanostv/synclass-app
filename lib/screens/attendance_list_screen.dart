import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:synclass_app/models/models.dart';
import 'package:synclass_app/providers/providers.dart';

class AttendanceListScreen extends StatefulWidget {
  const AttendanceListScreen({super.key});

  @override
  State<AttendanceListScreen> createState() => _AttendanceListScreenState();
}

class _AttendanceListScreenState extends State<AttendanceListScreen> {
  
  bool check1 = false;

  List<int> selectedAlumns = [];

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;

    final List<Alumn> alumns = arguments['alumns']; 
    final int groupId = arguments['groupId']; 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de asistencia'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
        decoration: BoxDecoration(
          color: const Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: alumns.length,
                itemBuilder: (BuildContext context, int index) {
                  final alumn = alumns[index];

                  return CheckboxListTile(
                    title: Text(alumn.name),
                    value: selectedAlumns.contains(alumn.id),
                    onChanged: (bool? value) {
                      setState(() {
                        if(value == true) {
                          selectedAlumns.add(alumn.id);
                        } else {
                          selectedAlumns.remove(alumn.id);
                        }
                      });
                    }
                  );
                },
              ),
            ),

            ElevatedButton(
              onPressed: () async {
                final groupProvider = Provider.of<GroupsProvider>(context, listen: false);

                await groupProvider.passAttendanceGroup(groupId, selectedAlumns);



                if(context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('¡Pase de lista completado!'),
                  ));

                  Navigator.pop(context);
                }
              },
              style: const ButtonStyle(
                elevation: MaterialStatePropertyAll(0),
              ),
              child: const Text('Finalizar'),
            ),
          ],
        )
    )
   );
  }
}