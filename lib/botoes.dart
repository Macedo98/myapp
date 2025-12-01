import 'package:flutter/material.dart';

class Botoes extends StatelessWidget {
  const Botoes({required this.resp, super.key});

  final void Function() resp;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: resp,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, //
          ),
        ),
        child: Text("Resposta1", style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
