import 'database_helper.dart';
import '/domain/roles.dart';
import 'package:sqflite/sqflite.dart';

class RoleDao {
  final String tableName = 'role';

  Future<List<Roles>> findAll() async {
    List<Roles> list = <Roles>[];

    DatabaseHelper databaseHelper = DatabaseHelper();
    Database db = await databaseHelper.db;

    String sql = 'SELECT * FROM $tableName';
    final result = await db.rawQuery(sql);

    for (var json in result) {
      Roles role = Roles.fromJson(json);
      list.add(role);
    }

    await Future.delayed(const Duration(seconds: 3));

    return list;
  }

  Future<bool> cadastrarRole(Roles role) async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    Database db = await databaseHelper.db;
    String sql =
        "INSERT INTO role (criador, nome_role, imagem_local, descricao, local_curto, obs, data, horario, custos, cep, idademin, visualizacoes, confirmacoes) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ? , ?, ?, ?, ?);";
    final result = await db.rawInsert(sql, [
      role.criador,
      role.nome_role,
      role.imagem_local,
      role.descricao,
      role.local_curto,
      role.obs,
      role.data,
      role.horario,
      role.custos,
      role.cep,
      role.idademin,
      0,
      0
    ]);
    if (result > 0) {
      return true;
    }
    await Future.delayed(const Duration(seconds: 3));
    return false;
  }
}
