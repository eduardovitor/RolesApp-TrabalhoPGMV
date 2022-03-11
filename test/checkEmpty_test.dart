import 'package:flutter_test/flutter_test.dart';
import 'package:rolesapp/Widget/myforminput.dart';

void main() {
  group('Testes da função checkEmpty', () {
    test(
        'Testar se a função retorna null quando o usuário digita coisas válidas',
        () {
      String teste_msg = 'Juliana Fonseca';
      var result = checkFieldEmpty(teste_msg);
      expect(result, null);
    });

    test('Testar se a função retorna mensagem quando o usuário não digita', () {
      String teste_msg = '';
      var result = checkFieldEmpty(teste_msg);
      expect(result, 'Por favor digite algo');
    });

    test(
        'Testar se a função retorna mensagem quando o usuário digita vários espaços',
        () {
      String teste_msg = '                         ';
      var result = checkFieldEmpty(teste_msg);
      expect(result, 'Por favor digite algo');
    });
  });
}
