import 'package:flutter/material.dart';

class Botoes extends StatelessWidget {
  const Botoes({
    required this.resp,
    required this.txt,
    required this.ponto,
    super.key,
  });

  final void Function(String, int) resp;
  final String txt;
  final int ponto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => resp(txt, ponto),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          child: Text(txt, style: const TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
