import 'package:flutter/material.dart';

import '../Colors/custom_colors_singleton.dart';
import '../Model/role.dart';
import '../View/role_details.dart';

class CardRole extends StatefulWidget {
  final Role role;
  const CardRole({Key? key, required this.role}) : super(key: key);

  @override
  _CardRoleState createState() => _CardRoleState();
}

class _CardRoleState extends State<CardRole> {
  Role get role => widget.role;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            child: buildConteudoRole()));
  }

  buildRowDataHorario() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 5),
        child: Row(
            children: [Text(role.data), const Text(','), Text(role.horario)]));
  }

  buildRowViewsPeople() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 5),
        child: Row(children: [
          Icon(Icons.remove_red_eye),
          Text(role.visualizacoes.toString()),
          SizedBox(width: 30),
          Icon(Icons.person_pin),
          Text(role.confirmacoes.toString())
        ]));
  }

  buildConteudoRole() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          role.nome_role,
          style: TextStyle(
            color: CustomColorsSing().DimGray,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          role.criador,
          style: TextStyle(
            color: CustomColorsSing().DimGray,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        mostrarImagem(),
        buildRowDataHorario(),
        Text(
          role.local_curto,
          style: TextStyle(
            color: CustomColorsSing().DimGray,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        buildRowViewsPeople()
      ],
    );
  }

  mostrarImagem() {
    if (role.imagem_local!.isEmpty) {
      return const Placeholder(fallbackHeight: 150, fallbackWidth: 150);
    } else {
      return Image.network(role.imagem_local!, height: 150, width: 150);
    }
  }

  onTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoleDetails(role: role),
      ),
    );
  }
}
