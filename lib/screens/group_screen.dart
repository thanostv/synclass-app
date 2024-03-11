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

  // TODO: Hacer que no se puede seleccionar fechas antes de la fecha inicial
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