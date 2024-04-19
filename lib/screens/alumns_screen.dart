import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:synclass_app/providers/providers.dart';

class AlumnsScreen extends StatelessWidget {
  const AlumnsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final groupProvider = Provider.of<GroupProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                    
                // Título Crea tu primer grupo
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    '¡Enlista tus alumnos!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                  
                const SizedBox(height: 20),
          
                Form(
                  key: groupProvider.alumnsFormKey,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: int.parse(groupProvider.alumnsNumberTextCtrl.text),
                    itemBuilder: (BuildContext context, int index) {
                      return TextFormField(
                        controller: groupProvider.editingControllerList[index],
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          filled: false,
                          prefixIconConstraints: const BoxConstraints(minWidth: 23, maxHeight: 20),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Icon(Icons.circle, color: Color(0xffD9D9D9)),
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              style: BorderStyle.solid,
                              color: Color(0xffD9D9D9)
                            ),
                          ),
                          hintText: 'Alumno ${index + 1}',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'El campo Alumno ${index + 1} es obligatorio';
                          }
                  
                          return null;
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () async {
                    if(groupProvider.validateAlumns()) {
                      await groupProvider.createGroup();
                      
                      if(context.mounted) Navigator.pushNamedAndRemoveUntil(context, 'magic-code-teacher', (route) => false);
                    }
                  },
                  style: const ButtonStyle(
                    elevation: MaterialStatePropertyAll(0),
                  ),
                  child: const Text('Finalizar'),
                ),
              ],
            ),
          ),
        ),
      ),
   );
  }
}