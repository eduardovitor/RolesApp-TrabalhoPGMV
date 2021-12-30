import 'package:flutter/material.dart';

import 'custom_colors.dart';

class CardRole extends StatefulWidget {
  final String criador;
  final String nome;
  final String imagem;
  final String data;
  final String horario;
  final String local;
  final int? visualizacoes;
  final int? confirmacoes;
  const CardRole(
      {Key? key,
      required this.criador,
      required this.nome,
      required this.imagem,
      required this.data,
      required this.horario,
      required this.local,
      this.visualizacoes = 0,
      this.confirmacoes = 0})
      : super(key: key);

  @override
  _CardRoleState createState() => _CardRoleState();
}

class _CardRoleState extends State<CardRole> {
  String get criador => widget.criador;
  String get nome => widget.nome;
  String get imagem => widget.imagem;
  String get data => widget.data;
  String get horario => widget.horario;
  String get local => widget.local;
  int? get visualizacoes => widget.visualizacoes;
  int? get confirmacoes => widget.confirmacoes;
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
        child: Row(children: [Text(data), const Text(','), Text(horario)]));
  }

  buildRowViewsPeople() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 5),
        child: Row(children: [
          Icon(Icons.remove_red_eye),
          Text(visualizacoes.toString()),
          SizedBox(width: 30),
          Icon(Icons.person_pin),
          Text(confirmacoes.toString())
        ]));
  }

  buildConteudoRole() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          nome,
          style: const TextStyle(
            color: CustomColors.DimGray,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          criador,
          style: const TextStyle(
            color: CustomColors.DimGray,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Image.network(imagem, height: 150, width: 150),
        buildRowDataHorario(),
        Text(
          local,
          style: const TextStyle(
            color: CustomColors.DimGray,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        buildRowViewsPeople()
      ],
    );
  }
}
