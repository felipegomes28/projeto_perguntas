import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelecao;

  const Resposta(this.texto, this.onSelecao, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onSelecao,
          style: ElevatedButton.styleFrom(
              primary: Colors.blue, onPrimary: Colors.white),
          child: Text(texto)),
    );
  }
}
