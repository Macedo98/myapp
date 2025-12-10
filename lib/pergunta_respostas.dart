class PerguntaRespostas {
  final String pergunta;
  final String? imagem;
  final List<Map<String, dynamic>> respostas;

  PerguntaRespostas({
    required this.pergunta,
    this.imagem,
    required this.respostas,
  });
}
