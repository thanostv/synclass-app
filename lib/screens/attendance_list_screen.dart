import 'package:flutter/material.dart';


class AttendanceListScreen extends StatefulWidget {
  const AttendanceListScreen({super.key});

  @override
  State<AttendanceListScreen> createState() => _AttendanceListScreenState();
}

class _AttendanceListScreenState extends State<AttendanceListScreen> {
  
  bool check1 = false;

  @override
  Widget build(BuildContext context) {
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
              child: ListView(
                children: [
                  CheckboxListTile(
                    title: const Text('1. Tania Lizeth Valles Páramo'),
                    value: check1,
                    onChanged: (bool? value) {
                      setState(() {
                        check1 = value!;
                      });
                    }
                  ),
              
                  const Divider(),
                ],
              ),
            ),

            ElevatedButton(
              onPressed: () {

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