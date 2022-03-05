import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  late Database _db;

  Future<Database> get db async {
    _db = await _initDB();
    return _db;
  }

  _initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'roles.db');
    print('> Path database: $path');

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );

    return database;
  }

  onCreate(Database db, int version) async {
    String sql =
        //Criação das tabelas
        'CREATE TABLE role(id int auto_increment primary key, criador varchar(50), nome_role varchar(20), imagem_local varchar(50), descricao varchar(50) NOT NULL, local_curto varchar(20), obs text, data VARCHAR(20), horario VARCHAR(20), custos float, cep varchar(12) NOT NULL, rua varchar(30) NOT NULL, bairro varchar(20) NOT NULL, comp varchar(50), num varchar(5), idademin int, visualizacoes int, confirmacoes int, cidade varchar(50), estado varchar(50));';
    await db.execute(sql);

    sql =
        'CREATE TABLE usuario(id int auto_increment primary key, apelido varchar(20) NOT NULL, nome varchar(50) NOT NULL, email varchar(30) NOT NULL, senha VARCHAR(16) NOT NULL, datanasc VARCHAR(10) NOT NULL, url_imagem varchar(100), idade INT, fuma VARCHAR(1), bebe VARCHAR(1));';
    await db.execute(sql);

    sql =
        "CREATE TABLE usuario_vai_Role(FK_idrole INT,FK_idusuario INT,gostou varchar(1),nota int,reclamacao text,FOREIGN KEY(FK_idrole) REFERENCES role(id), FOREIGN KEY(FK_idusuario) REFERENCES usuario(id));";

    //Inserções
    sql =
        "INSERT INTO role (criador, nome_role, imagem_local, descricao, local_curto, obs, data, horario, custos, cep, cidade, estado, rua, bairro, comp, num, idademin, visualizacoes, confirmacoes) VALUES ('Eduardo Vitor', 'Passeio no bosque', 'https://arapiraca.nyc3.cdn.digitaloceanspaces.com/2019/03/fonteluninosa-1.jpeg', 'Um rolê para comemorar a nossa amável existência', 'Bosque das Arapiracas', 'Vai ser massa', '03/02/2022', '15:30', 0 , '57302-400', 'Los Angeles', 'California', 'Rua Fausto Joaquim Luciano', 'Capiatã', 'Próximo do Ginásio João Paulo', 'S/N', 20, 0, 0);";
    await db.execute(sql);
    sql =
        "INSERT INTO role (criador, nome_role, imagem_local, descricao, local_curto, obs, data, horario, custos, cep, cidade, estado, rua, bairro, comp, num, idademin, visualizacoes, confirmacoes) VALUES ('Carlos', 'Show do Travis Scott', 'https://i.ytimg.com/vi/ZQe1CvuJStI/maxresdefault.jpg', 'Um rolê para comemorar a nossa amável existência', 'Los Angeles', 'Vai ser massa', '05/03/2022', '22:00', 50 , '199209-400', 'Los Angeles', 'California','Vahn Street', 'Beverly', 'Near Hollywood', 'S/N', 29, 0, 0);";
    await db.execute(sql);
    sql =
        "INSERT INTO role (criador, nome_role, imagem_local, descricao, local_curto, obs, data, horario, custos, cep, cidade, estado, rua, bairro, comp, num, idademin, visualizacoes, confirmacoes) VALUES ('Jânio', 'Jogo do Corinthians', 'https://jpimg.com.br/uploads/2020/03/arena-corinthians-div.jpg', 'Um rolê para comemorar a nossa amável existência', 'São Paulo, Neo química Arena', 'Vai ser massa', '12/06/2022', '20:00', 50 , '199209-400', 'Los Angeles', 'California', 'Vahn Street', 'Beverly', 'Near Hollywood', 'S/N', 29, 0, 0);";
    await db.execute(sql);

    sql =
        "INSERT INTO usuario (apelido, nome, email, senha, datanasc, url_imagem, idade, fuma, bebe) VALUES ('Vampirinho', 'Carlinhos', 'carlos@gmail.com', '12345', '13/07/1995', 'https://upload.wikimedia.org/wikipedia/pt/6/6d/JeanLucPicard.jpg', 26, 'N', 'S');";
    await db.execute(sql);
    sql =
        "INSERT INTO usuario (apelido, nome, email, senha, datanasc, url_imagem, idade, fuma, bebe) VALUES ('La bella', 'Morgana', 'morgana@gmail.com', 'joaninha', '13/03/1985', 'https://pbs.twimg.com/profile_images/1276471354724761601/2IL9V18-_400x400.jpg', 36, 'N', 'S');";
    await db.execute(sql);

    // sql =
    //     "INSERT INTO usuario_vai_role (FK_idrole, FK_idusuario, gostou, nota, reclamacao) VALUES (1, 1, 'N', 5, 'Podia ser mais calmo.');";
    // await db.execute(sql);
    // sql =
    //     "INSERT INTO usuario_vai_role (FK_idrole, FK_idusuario, gostou, nota, reclamacao) VALUES (1, 2, 'S', 9, 'Faltou dinamite pangaláctica.');";
    // await db.execute(sql);
  }
}
