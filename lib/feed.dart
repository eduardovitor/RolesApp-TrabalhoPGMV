import 'package:flutter/material.dart';
import 'package:rolesapp/card_role.dart';

import 'custom_colors.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildRolesView());
  }
}

buildRolesView() {
  return ListView(padding: const EdgeInsets.all(16), children: [
    CardRole(
        criador: 'Eduardo Vitor',
        nome: 'Passeio no bosque',
        imagem:
            'https://arapiraca.nyc3.cdn.digitaloceanspaces.com/2019/03/fonteluninosa-1.jpeg',
        data: '03/02/2021',
        horario: '15:30',
        local: 'Bosque das Arapiracas'),
    CardRole(
        criador: 'Eduardo Vitor',
        nome: 'Passeio no bosque',
        imagem:
            'https://arapiraca.nyc3.cdn.digitaloceanspaces.com/2019/03/fonteluninosa-1.jpeg',
        data: '03/02/2021',
        horario: '15:30',
        local: 'Bosque das Arapiracas'),
    CardRole(
        criador: 'Eduardo Vitor',
        nome: 'Passeio no bosque',
        imagem:
            'https://arapiraca.nyc3.cdn.digitaloceanspaces.com/2019/03/fonteluninosa-1.jpeg',
        data: '03/02/2021',
        horario: '15:30',
        local: 'Bosque das Arapiracas')
  ]);
}
