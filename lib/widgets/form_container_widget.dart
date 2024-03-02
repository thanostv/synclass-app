import 'package:flutter/material.dart';

class FormContainerWidget extends StatelessWidget {

  final List<Widget> children;

  // TODO: Agregar state del formulario

  const FormContainerWidget({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        child: Column(children: children)
      ),
    );
  }
}