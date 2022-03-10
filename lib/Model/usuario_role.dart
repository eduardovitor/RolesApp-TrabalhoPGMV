class UsuarioRole {
  late int id_role;
  late int id_usuario;
  late String gostou;
  late int nota;
  late String reclamacao;

  UsuarioRole(
      {required this.id_role,
      required this.id_usuario,
      required this.gostou,
      required this.nota,
      required this.reclamacao});

  UsuarioRole.fromJson(Map<String, dynamic> json) {
    id_role = json['id_role'];
    id_usuario = json['id_usuario'];
    gostou = json['gostou'];
    nota = json['nota'];
    reclamacao = json['reclamacao'];
  }
}
