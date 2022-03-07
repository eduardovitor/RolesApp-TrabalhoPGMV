import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rolesapp/maps_page.dart';
import 'package:rolesapp/myforminput.dart';

import 'custom_colors.dart';
import 'data/cep_api.dart';
import 'domain/cep.dart';
import 'domain/roles.dart';
import 'geocoding_api.dart';

class RoleDetails extends StatefulWidget {
  final Roles role;
  const RoleDetails({Key? key, required this.role}) : super(key: key);

  @override
  State<RoleDetails> createState() => _RoleDetailsState();
}

class _RoleDetailsState extends State<RoleDetails> {
  Roles get role => widget.role;
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
              style: const TextStyle(
                color: CustomColors.DimGray,
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
              style: const TextStyle(
                color: CustomColors.DimGray,
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
              style: const TextStyle(
                color: CustomColors.DimGray,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(width: 12),
          const Icon(Icons.monetization_on),
          const SizedBox(width: 2),
          Text(role.custos.toString(),
              style: const TextStyle(
                color: CustomColors.DimGray,
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
              style: const TextStyle(
                color: CustomColors.DimGray,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    );
  }

  buildBotaoLocalizacao() {
    return FloatingActionButton(
        backgroundColor: CustomColors.purple,
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
    CepApi cepapi = CepApi();
    Cep cep;
    cep = await cepapi.getCep(role.cep);
    var busca = cep.logradouro + ' ' + cep.bairro + ' ' + cep.localidade;
    print(busca);
    LatLng local = await GeocodingApi().buscarLocalizacaoPorEnd(busca);
    return local;
  }
}
