import 'package:flutter/material.dart';
import './questão.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) quandoResponder;

  const Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
    super.key,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : [];
    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'].toString(),
            () => quandoResponder(int.parse(resp['pontuacao'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
