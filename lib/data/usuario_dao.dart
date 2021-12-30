import 'database_helper.dart';
import '/domain/usuarios.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioDao {
  final String tableName = 'usuario';

  Future<List<Usuarios>> findAll() async {
    List<Usuarios> list = <Usuarios>[];

    DatabaseHelper databaseHelper = DatabaseHelper();
    Database db = await databaseHelper.db;

    String sql = 'SELECT * FROM $tableName';
    final result = await db.rawQuery(sql);

    for (var json in result) {
      Usuarios usuario = Usuarios.fromJson(json);
      list.add(usuario);
    }

    await Future.delayed(const Duration(seconds: 3));

    return list;
  }
}
