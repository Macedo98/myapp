import 'package:flutter/material.dart';
import './pergunta_respostas.dart';
import './dados.dart';
import './lista_perguntas.dart';
import './resultado.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const PerguntasApp());
}

class PerguntasApp extends StatelessWidget {
  const PerguntasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        useMaterial3: true, // Adicionado para Material 3
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState(); // Corrigido: State<Home>
}

class _HomeState extends State<Home> {
  final List<PerguntaRespostas> dados = List.from(
      perguntasRespostas); // Criando cópia para não modificar a original
  List<Map<String, dynamic>> respostas = [];
  int indicePergunta = 0;
  int totalPontos = 0;

  void responder(String r, int ponto) {
    final String p = dados[indicePergunta].pergunta;
    respostas.add({'pergunta': p, 'resposta': r, 'ponto': ponto});
    setState(() {
      totalPontos += ponto;
      indicePergunta++;
    });
  }

  void reiniciar() {
    setState(() {
      indicePergunta = 0;
      respostas = [];
      totalPontos = 0;
      dados.clear();
      dados.addAll(
          List.from(perguntasRespostas)); // Recarrega os dados originais
      dados.shuffle(); // reembaralha as perguntas quando reinicia
    });
  }

  bool get temPergunta => indicePergunta < dados.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Macedo',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        toolbarHeight: 80,
        elevation: 4, // Adiciona sombra
      ),
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: temPergunta
            ? ListaPerguntas(
                indicePergunta: indicePergunta,
                perguntas: dados,
                responder: responder,
              )
            : Resultado(
                respostas: respostas,
                reiniciar: reiniciar,
                totalPontos: totalPontos,
              ), // Adicionada vírgula
      ),
    );
  }
}
