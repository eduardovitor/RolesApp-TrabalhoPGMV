class Role {
  late String nome_role;
  late String local_curto;
  late String descricao;
  late String criador;
  late String? obs;
  late String data;
  late String horario;
  late double custos;
  late String cep;
  late String? imagem_local;
  late int idademin;
  late int? visualizacoes;
  late int? confirmacoes;
  Role(
      {required this.nome_role,
      required this.descricao,
      required this.criador,
      this.obs,
      required this.data,
      required this.horario,
      required this.custos,
      required this.cep,
      this.imagem_local,
      required this.idademin,
      required this.local_curto,
      this.visualizacoes,
      this.confirmacoes});

  Role.fromJson(Map<String, dynamic> json) {
    nome_role = json['nome_role'];
    descricao = json['descricao'];
    criador = json['criador'];
    obs = json['obs'];
    data = json['data'];
    horario = json['horario'];
    custos = json['custos'];
    cep = json['cep'];
    imagem_local = json['imagem_local'];
    idademin = json['idademin'];
    local_curto = json['local_curto'];
    visualizacoes = json['visualizacoes'];
    confirmacoes = json['confirmacoes'];
  }
}
