import 'dart:io';

import 'package:sqflite/sqflite.dart';

Future<void> prepareDatabase() {
  var sql = '''
    CREATE TABLE trabalhador (
      idTrabalhador INTEGER,
      bi TEXT,
      nome TEXT,
      data DATE,
      morada TEXT,
      urlDaFoto TEXT,
      salario REAL
    );

    CREATE TABLE usuario (
      idUsuario INTEGER,
      bi TEXT,
      nome TEXT,
      data DATE,
      morada TEXT,
      urlDaFoto TEXT
    );

    CREATE TABLE dinheiro (
      idDinheiro INTEGER,
      valorPresente REAL,
      valorTotal REAL,
      data DATETIME,
      idTrabalhador INTEGER
    );
    ''';

  var path = '${getDatabasesPath()}${Platform.pathSeparator}dados.db';
  return openDatabase(
    path,
    onCreate: (db, version) {
      return db.execute(sql);
    },
  );
}
