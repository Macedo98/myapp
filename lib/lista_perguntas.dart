import 'package:flutter/material.dart';
import './pergunta_respostas.dart';
import './botoes.dart';

class ListaPerguntas extends StatelessWidget {
  final int indicePergunta;
  final List<PerguntaRespostas> perguntas;
  final void Function(String, int) responder;

  const ListaPerguntas({
    super.key,
    required this.indicePergunta,
    required this.perguntas,
    required this.responder,
  });

  @override
  Widget build(BuildContext context) {
    final perguntaAtual = perguntas[indicePergunta];
    // shuffle apenas das respostas (lista de maps)
    perguntaAtual.respostas.shuffle();

    return Column(
      children: [
        Text(
          perguntaAtual.pergunta,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child:
              perguntaAtual.imagem != null && perguntaAtual.imagem!.isNotEmpty
                  ? Image.asset(
                      perguntaAtual.imagem!,
                      width: double.infinity,
                    )
                  : const SizedBox.shrink(),
        ),
        const SizedBox(height: 16),
        ...perguntaAtual.respostas.map(
          (resposta) {
            final String txt = resposta['r']?.toString() ?? '';
            final int ponto = (resposta['p'] is int)
                ? resposta['p'] as int
                : int.tryParse('${resposta['p']}') ?? 0;
            return Botoes(resp: responder, txt: txt, ponto: ponto);
          },
        ).toList(),
      ],
    );
  }
}
