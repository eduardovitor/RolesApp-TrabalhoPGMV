import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rolesapp/domain/cep.dart';


class CepApi {
  final String baseUrl = 'viacep.com.br';
  final Map<String, String> headers = {'Content-Type': 'application/json'};

  Future<Cep> getCep(String cep) async {
    Uri url = Uri.https(baseUrl, '/ws/'+cep+'/json/');
    Response response = await http.get(url, headers: headers);
    Cep? pacote;

    if (response.statusCode == 200) {
      var decodedResponse =
          json.decode(response.body); // String p/ Json
      for (var jsonElement in decodedResponse) {
        Cep pacote = Cep.fromJson(jsonElement);
      }
    }
    return pacote!;
  }
  
  
  /*Future<List<Cep>> findAll() async {
    Uri url = Uri.https(baseUrl, '/api/findAll');
    Response response = await http.get(url, headers: headers);

    List<Cep> pacotes = <Cep>[];

    if (response.statusCode == 200) {
      List<dynamic> decodedResponse =
          json.decode(response.body); // String p/ Json
      for (var jsonElement in decodedResponse) {
        Cep pacote = Cep.fromJson(jsonElement);

        pacotes.add(pacote);
      }
    }

    return pacotes;
  }*/

}