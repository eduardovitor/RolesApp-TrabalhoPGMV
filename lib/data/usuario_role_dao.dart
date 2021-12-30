import 'database_helper.dart';
import '/domain/usuario_role.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioRoleDao {
  final String tableName = 'usuario_vai_role';

  Future<List<UsuarioRole>> findAll() async {
    List<UsuarioRole> list = <UsuarioRole>[];

    DatabaseHelper databaseHelper = DatabaseHelper();
    Database db = await databaseHelper.db;

    String sql = 'SELECT * FROM $tableName';
    final result = await db.rawQuery(sql);

    for (var json in result) {
      UsuarioRole usuario_role = UsuarioRole.fromJson(json);
      list.add(usuario_role);
    }

    await Future.delayed(const Duration(seconds: 3));

    return list;
  }
}
