import 'dart:io';

import 'package:sqflite/sqflite.dart';

Future<void> prepareDatabase() {
  var sql = '''
    CREATE TABLE trabalhador (
      idTrabalhador INTEGER PRIMARY KEY AUTOINCREMENT,
      bi TEXT,
      nome TEXT,
      data DATE,
      morada TEXT,
      urlDaFoto TEXT,
      salario REAL
    );

    CREATE TABLE usuario (
      idUsuario INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      userName TEXT,
      senha TEXT,
      urlDaFoto TEXT
    );

    CREATE TABLE dinheiro (
      idDinheiro INTEGER PRIMARY KEY AUTOINCREMENT,
      valorPresente REAL,
      valorTotal REAL,
      data DATETIME,
      idTrabalhador INTEGER
    );
    ''';

  var path = '${getDatabasesPath()}${Platform.pathSeparator}dados.db';
  return openDatabase(
    path,
    version: 1,
    onCreate: (db, version) {
      return db.execute(sql);
    },
  );
}
