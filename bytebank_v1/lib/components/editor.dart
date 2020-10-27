import 'package:flutter/material.dart';

class Editor extends StatelessWidget {

  final TextEditingController controller;
  final String rotulo;
  final String dica;
  final IconData icon;
  final TextInputType keyboardType;

  Editor({this.controller, this.rotulo, this.dica, this.icon, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              style: TextStyle(fontSize: 24),
              keyboardType: keyboardType,
              decoration: InputDecoration(
                icon: icon != null ? Icon(icon) : null,
                labelText: rotulo, 
                hintText: dica),
            ),
          );
  }
}
