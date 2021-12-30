class Usuarios {
  late String apelido;
  late String nome;
  late String email;
  late String senha;
  late String datanasc;
  late String url_imagem;
  late int idade;
  late String fuma;
  late String bebe;

  Usuarios(
      {required this.apelido,
      required this.nome,
      required this.email,
      required this.senha,
      required this.datanasc,
      required this.url_imagem,
      required this.idade,
      required this.fuma,
      required this.bebe});

  Usuarios.fromJson(Map<String, dynamic> json) {
    apelido = json['apelido'];
    nome = json['nome'];
    email = json['email'];
    senha = json['senha'];
    datanasc = json['datanasc'];
    url_imagem = json['url_imagem'];
    fuma = json['fuma'];
    idade = json['idade'];
    bebe = json['bebe'];
  }
}
