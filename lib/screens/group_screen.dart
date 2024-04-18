import 'package:flutter/material.dart';

import 'package:synclass_app/widgets/widgets.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  final startDate = TextEditingController();
  final endDate = TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future<String?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if(picked != null && picked != selectedDate) {
      final date = '${picked.day}/${picked.month}/${picked.year}';

      return date;
    }

    return null;
  }

  bool active = false;

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

  final List<int> _selectedDays = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
                const SizedBox(height: 20),
        
                // Título Crea tu primer grupo
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Crea tu primer grupo',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
        
                const SizedBox(height: 20),

                FormContainerWidget(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Nombre del grupo',
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: TextFormField(
                            controller: startDate,
                            readOnly: true,
                            onTap: () async {
                              final date = await _selectDate(context);

                              if(date != null) startDate.text = date;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Comienza',
                            ),
                          ),
                        ),

                        const SizedBox(width: 20),
                        
                        Flexible(
                          flex: 1,
                          child: TextFormField(
                            controller: endDate,
                            readOnly: true,
                            onTap: () async {
                              final date = await _selectDate(context);

                              if(date != null) endDate.text = date;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Finaliza',
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: days.map((key, value) => MapEntry(key, GestureDetector(
                          onTap: () {
                            setState(() {
                              actives[key] = !actives[key];

                              if(actives[key]) {
                                _selectedDays.add(key);
                              } else {
                                _selectedDays.remove(key);
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration:  BoxDecoration(
                              color: actives[key]
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

                    const SizedBox(height: 20),

                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Número de alumnos',
                      ),
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'alumns');
                        // Navigator.pushNamedAndRemoveUntil(context, 'alumns', (route) => false);
                      },
                      style: const ButtonStyle(
                        elevation: MaterialStatePropertyAll(0),
                      ),
                      child: const Text('Agregar alumnos'),
                    ),
                  ],
                )
            ],
          ),
        ),
      )
   );
  }
}

                        // ...days.mapIndexed((index, element) => GestureDetector(
                        //   onTap: () {
                        //     setState(() {
                        //       actives[index] = !actives[index];
                        //     });
                        //   },
                        //   child: Container(
                        //     padding: const EdgeInsets.all(8),
                        //     decoration:  BoxDecoration(
                        //       color: actives[index]
                        //         ? const Color(0xff585151).withOpacity(.53)
                        //         : null,
                        //       shape: BoxShape.circle
                        //     ),
                        //     child: Text(element)
                        //   ),
                        // ))