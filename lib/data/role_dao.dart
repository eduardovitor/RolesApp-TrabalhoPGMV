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
}
