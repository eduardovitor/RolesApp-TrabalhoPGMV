import '../Database/database_helper.dart';
import '../Model/usuario.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioController {
  final String tableName = 'usuario';

  Future<List<Usuario>> findAll() async {
    List<Usuario> list = <Usuario>[];

    DatabaseHelper databaseHelper = DatabaseHelper();
    Database db = await databaseHelper.db;

    String sql = 'SELECT * FROM $tableName';
    final result = await db.rawQuery(sql);

    for (var json in result) {
      Usuario usuario = Usuario.fromJson(json);
      list.add(usuario);
    }

    await Future.delayed(const Duration(seconds: 3));

    return list;
  }

  Future<bool> login(email, senha) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    Database db = await databaseHelper.db;
    String sql = 'SELECT email,senha FROM $tableName where email=? and senha=?';
    final result = await db.rawQuery(sql, [email, senha]);
    if (result.length > 0) {
      return true;
    }
    await Future.delayed(const Duration(seconds: 3));
    return false;
  }

  Future<bool> cadastrarUsuario(Usuario usuario) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    Database db = await databaseHelper.db;
    String sql =
        "INSERT INTO usuario (apelido, nome, email, senha, datanasc, url_imagem, idade, fuma, bebe) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
    final result = await db.rawInsert(sql, [
      usuario.apelido,
      usuario.nome,
      usuario.email,
      usuario.senha,
      usuario.datanasc,
      usuario.url_imagem,
      usuario.idade,
      usuario.fuma,
      usuario.bebe
    ]);
    if (result > 0) {
      return true;
    }
    await Future.delayed(const Duration(seconds: 3));
    return false;
  }
}
