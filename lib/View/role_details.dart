import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rolesapp/Controller/api_controller.dart';

import '../Colors/custom_colors_singleton.dart';
import '../Model/cep.dart';
import '../Model/role.dart';
import '../Widget/myforminput.dart';
import 'maps_page.dart';

class RoleDetails extends StatefulWidget {
  final Role role;
  const RoleDetails({Key? key, required this.role}) : super(key: key);

  @override
  State<RoleDetails> createState() => _RoleDetailsState();
}

class _RoleDetailsState extends State<RoleDetails> {
  Role get role => widget.role;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      floatingActionButton: buildBotaoLocalizacao(),
    );
  }

  buildBody() {
    return ListView(children: [
      buildBotaoVoltar(),
      buildNomeRole(),
      buildImagemRole(),
      buildCriador(),
      buildTextos('O que rola:\n\n' + role.descricao),
      buildDataHorarioCustos(),
      buildTextos('Idade mínima: ' + role.idademin.toString()),
      buildObs()
    ]);
  }

  buildBotaoVoltar() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_outlined,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }

  buildNomeRole() {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Center(
          child: Text(role.nome_role,
              style: TextStyle(
                color: CustomColorsSing().DimGray,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ))),
    );
  }

  buildImagemRole() {
    return Padding(
        padding: const EdgeInsets.all(2),
        child: Center(
          child: mostrarImagem(),
        ));
  }

  mostrarImagem() {
    if (role.imagem_local!.isEmpty) {
      return const Placeholder(fallbackHeight: 200, fallbackWidth: 200);
    } else {
      return Image.network(role.imagem_local!, height: 200, width: 200);
    }
  }

  buildObs() {
    var check = checkFieldEmpty(role.obs);
    if (check == null) {
      return buildTextos('Observações: ' + role.obs!);
    } else {
      return null;
    }
  }

  buildTextos(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(text,
              style: TextStyle(
                color: CustomColorsSing().DimGray,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ))),
    );
  }

  buildDataHorarioCustos() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Icon(Icons.calendar_today),
          const SizedBox(width: 2),
          Text(role.data + ', ' + role.horario,
              style: TextStyle(
                color: CustomColorsSing().DimGray,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(width: 12),
          const Icon(Icons.monetization_on),
          const SizedBox(width: 2),
          Text(role.custos.toString(),
              style: TextStyle(
                color: CustomColorsSing().DimGray,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    );
  }

  buildCriador() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Icon(Icons.person),
          const SizedBox(width: 2),
          Text(role.criador,
              style: TextStyle(
                color: CustomColorsSing().DimGray,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    );
  }

  buildBotaoLocalizacao() {
    return FloatingActionButton(
        backgroundColor: CustomColorsSing().purple,
        onPressed: () async {
          var local = await getLocation();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MapsPage(local: local),
            ),
          );
        },
        child: const Icon(Icons.location_pin));
  }

  getLocation() async {
    ApiController api_controller = ApiController();
    Cep cep;
    cep = await api_controller.cep_api.getCep(role.cep);
    var busca = cep.logradouro + ' ' + cep.bairro + ' ' + cep.localidade;
    LatLng local =
        await api_controller.geocod_api.buscarLocalizacaoPorEnd(busca);
    return local;
  }
}
