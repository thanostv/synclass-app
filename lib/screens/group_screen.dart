import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:synclass_app/providers/providers.dart';
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

  Future<List<dynamic>?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101)
    );

    if(picked != null && picked != selectedDate) {
      final date = '${picked.day}/${picked.month}/${picked.year}';

      return [date, picked];
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
  final groupProvider = Provider.of<GroupProvider>(context);
    
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
                  formKey: groupProvider.groupformKey,
                  children: [
                    TextFormField(
                      controller: groupProvider.groupNameTextCtrl,
                      decoration: const InputDecoration(
                        hintText: 'Nombre del grupo',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'El campo Nombre del grupo es obligatorio';
                        }

                        return null;
                      },
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

                              if(date != null) {
                                startDate.text = date[0];
                                groupProvider.initialDate = date[1];
                              }
                            },
                            decoration: const InputDecoration(
                              hintText: 'Comienza',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Obligatorio';
                              }

                              return null;
                            },
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

                              if(date != null) {
                                endDate.text = date[0];
                                groupProvider.finalDate = date[1];
                              }
                            },
                            decoration: const InputDecoration(
                              hintText: 'Finaliza',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Obligatorio';
                              }

                              return null;
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    FormField<List<int>?>(
                      initialValue: groupProvider.selectedDays,
                      builder: (FormFieldState<List<int>?> state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: days.map((key, value) => MapEntry(key, GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      actives[key] = !actives[key];
                            
                                      if(actives[key]) {
                                        groupProvider.selectedDays.add(key);
                                      } else {
                                        groupProvider.selectedDays.remove(key);
                                      }
                            
                                      state.didChange(groupProvider.selectedDays);
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
                            Builder(
                              builder: (BuildContext context) => Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: state.errorText != null
                                  ? Text(
                                      state.errorText ?? "",
                                      style: TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 12),
                                      textAlign: TextAlign.start,
                                    )
                                  : null
                              ),
                            )
                          ],
                        );
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Debes seleccionar al menos un día';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 10),

                    TextFormField(
                      controller: groupProvider.alumnsNumberTextCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Número de alumnos',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'El campo Número de alumnos es obligatorio';
                        }

                        return null;
                      },
                      onChanged: (value) {
                        if(value != '') {
                          groupProvider.editingControllerList = List.generate(
                            int.parse(value),
                            (i) => TextEditingController()
                          );
                        }
                      },
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        if(groupProvider.validateGroup()) {  
                          Navigator.pushNamed(context, 'alumns');
                        }
                        // Navigator.pushNamed(context, 'alumns');
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