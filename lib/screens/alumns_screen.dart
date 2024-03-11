import 'package:flutter/material.dart';

class AlumnsScreen extends StatelessWidget {
  const AlumnsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
            
                TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                    filled: false,
                    prefixIconConstraints: BoxConstraints(minWidth: 23, maxHeight: 20),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(Icons.circle, color: Color(0xffD9D9D9)),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                        color: Color(0xffD9D9D9)
                      ),
                    ),
                    hintText: 'Alumno 1',
                  ),
                ),

                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'magic-code-teacher');
                    // Navigator.pushNamedAndRemoveUntil(context, 'alumns', (route) => false);
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