import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../Model/cep.dart';

class CepApi {
  final String baseUrl = 'viacep.com.br';
  final Map<String, String> headers = {'Content-Type': 'application/json'};

  Future<Cep> getCep(String cep) async {
    Uri url = Uri.https(baseUrl, '/ws/' + cep + '/json/');
    Response response = await http.get(url, headers: headers);
    Cep? pacote;

    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body);
      pacote = Cep.fromJson(decodedResponse);
    }
    try {
      return pacote!;
    } catch (e) {
      Cep erro_cep = Cep(
          cep: '0000',
          bairro: '',
          complemento: '',
          ddd: '',
          gia: '',
          ibge: '',
          localidade: '',
          logradouro: '',
          siafi: '',
          uf: '');
      return erro_cep;
    }
  }
}
