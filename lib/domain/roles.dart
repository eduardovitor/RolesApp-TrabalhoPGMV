class Roles {
  late String nome_role;
  late String local_curto;
  late String descricao;
  late String criador;
  late String? obs;
  late String data;
  late String horario;
  late double custos;
  late String cep;
  late String rua;
  late String cidade;
  late String estado;
  late String bairro;
  late String? comp;
  late String numero;
  late String imagem_local;
  late int idademin;
  late int? visualizacoes;
  late int? confirmacoes;
  Roles(
      {required this.nome_role,
      required this.descricao,
      required this.criador,
      this.obs,
      required this.data,
      required this.horario,
      required this.custos,
      required this.cep,
      required this.rua,
      required this.bairro,
      this.comp,
      required this.cidade,
      required this.estado,
      required this.numero,
      required this.imagem_local,
      required this.idademin,
      required this.local_curto,
      this.visualizacoes,
      this.confirmacoes});

  Roles.fromJson(Map<String, dynamic> json) {
    nome_role = json['nome_role'];
    descricao = json['descricao'];
    criador = json['criador'];
    obs = json['obs'];
    data = json['data'];
    horario = json['horario'];
    custos = json['custos'];
    cep = json['cep'];
    rua = json['rua'];
    bairro = json['bairro'];
    comp = json['comp'];
    numero = json['num'];
    imagem_local = json['imagem_local'];
    idademin = json['idademin'];
    local_curto = json['local_curto'];
    visualizacoes = json['visualizacoes'];
    confirmacoes = json['confirmacoes'];
    cidade = json['cidade'];
    estado = json['estado'];
  }
}
