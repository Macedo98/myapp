import 'package:flutter/material.dart';
import 'package:myapp/botoes.dart';

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
  final perguntas = [
    {
      'pergunta': 'Qual a sua cor favorita entre essas 2?',
      'respostas': [
        'preto',
        'branco',
      ],
    },
    {
      'pergunta': 'Qual seu animal favorito entre esses?',
      'respostas': ['Gato', 'Cachorro', 'Ornitorrinco'],
    },
    {
      'pergunta': 'Qual é o seu time?',
      'respostas': [
        'Palmeiras',
        'Corinthians',
        'São Paulo',
        'Santos',
      ],
    },
    {
      'pergunta': 'Qual sua materia preferida?',
      'respostas': [
        'Portugues',
        'Matematica',
        'Química',
        'Educação Fisica',
      ]
    }
  ];

  var indicePergunta = 0;

  void responder() {
    if (indicePergunta < perguntas.length - 1) {
      indicePergunta++;
    } else {
      indicePergunta = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Macedo', style: TextStyle(fontSize: 30)),
        centerTitle: true,
        backgroundColor: Colors.red,
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              perguntas[indicePergunta]['pergunta'].toString(),
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 20),
            ...((perguntas[indicePergunta]['respostas'] as List<String>)
                .map((textoBotao) => Botoes(resp: responder, txt: textoBotao))
                .toList()),
          ],
        ),
      ),
    );
  }
}
