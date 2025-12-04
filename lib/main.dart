import 'package:flutter/material.dart';
import 'package:myapp/pergunta_respostas.dart';
import './dados.dart';
import './lista_perguntas.dart';
// import './resultado.dart';

void main() {
  runApp(const PerguntasApp());
}

class PerguntasApp extends StatelessWidget {
  const PerguntasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final List<PerguntaRespostas> dados = perguntasRespostas;
  List<Map<String, String>> respostas = [];
  var indicePergunta = 0;

  void responder(String r) {
    String p = dados[indicePergunta].pergunta;
    respostas.add({'pergunta': p, 'resposta': r});
    setState(() {
      indicePergunta++;
    });
  }

  void reiniciar() {
    setState(() {
      indicePergunta = 0;
      respostas = [];
    });
  }

  bool get temPergunta {
    return indicePergunta < dados.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Macedo',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        toolbarHeight: 80,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: temPergunta
              ? ListaPerguntas(
                  indicePergunta: indicePergunta,
                  perguntas: dados,
                  responder: responder,
                )
              : null //Resultado(respostas: respostas, reiniciar: reiniciar),
          ),
    );
  }
}
