import 'package:flutter_test/flutter_test.dart';
import 'package:rolesapp/Controller/api_controller.dart';

void main() {
  group('Testes da API do CEP', () {
    test('Testar se a API retorna Cep válido', () async {
      String teste_cep = '57304400';
      String expected = '57304-400';
      ApiController apicontroller = ApiController();
      var result = await apicontroller.cep_api.getCep(teste_cep);
      expect(result.cep, expected);
    });

    test('Testar se a API retorna Cep de erro quando passado Ceps inválidos',
        () async {
      String teste_cep = '6000000';
      String cep_erro = '0000';
      ApiController apicontroller = ApiController();
      var result = await apicontroller.cep_api.getCep(teste_cep);
      expect(result.cep, cep_erro);
    });
  });
}
