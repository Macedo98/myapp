import 'package:flutter/material.dart';
import './itens.dart';

class Resultado extends StatelessWidget {
  const Resultado({
    super.key,
    required this.respostas,
    required this.reiniciar,
    required this.totalPontos,
  });

  final List<Map<String, dynamic>> respostas;
  final VoidCallback reiniciar;
  final int totalPontos;

  String getMensagem() {
    if (totalPontos == 10) {
      return 'PARABÉNS';
    } else if (totalPontos >= 6) {
      return 'APROVADO';
    } else if (totalPontos >= 3) {
      return 'RECUPERAÇÃO';
    } else {
      return 'REPROVADO';
    }
  }

  Color getCorMensagem() {
    if (totalPontos == 10) {
      return Colors.green;
    } else if (totalPontos >= 6) {
      return Colors.blue;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final String mensagem = getMensagem();
    final Color cor = getCorMensagem();

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            const Text(
              "Respostas",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 203, 152, 1),
              ),
            ),
            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Image.asset(
                'assets/images/ouro.jpg',
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),

            // Lista de respostas (cards)
            ...respostas
                .map((resp) => Itens(
                      pergunta: resp['pergunta'] ?? '',
                      resposta: resp['resposta'] ?? '',
                      ponto: (resp['ponto'] is int)
                          ? resp['ponto'] as int
                          : int.tryParse('${resp['ponto']}') ?? 0,
                    ))
                .toList(),

            const SizedBox(height: 20),

            Text(
              '$mensagem - Total de pontos: $totalPontos',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: cor,
              ),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: reiniciar,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                padding: const EdgeInsets.symmetric(vertical: 10),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: const Text(
                'Reiniciar',
                style: TextStyle(fontSize: 18),
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
