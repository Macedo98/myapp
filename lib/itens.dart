import 'package:flutter/material.dart';

class Itens extends StatelessWidget {
  final String pergunta;
  final String resposta;
  final int ponto;

  const Itens({
    super.key,
    required this.pergunta,
    required this.resposta,
    required this.ponto,
  });

  @override
  Widget build(BuildContext context) {
    final Color respostaColor = ponto == 0 ? Colors.red : Colors.green;

    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            // centralizar texto conforme documento
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                pergunta,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18, // menor para ficar mais compacto
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                resposta.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14, // menor também
                  color: respostaColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
