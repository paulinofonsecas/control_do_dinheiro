import 'dart:io';

import 'package:control_do_dinheiro/core/data/erros/erros.dart';
import 'package:control_do_dinheiro/core/data/models/dinheiro_model.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

class BaseDeDadosDoDinheiro {
  var table = 'dinheiro ';
  var idTrabalhadorColumn = 'idTrabalhador';
  var biColumn = 'bi';
  var nomeColumn = 'nome';
  var dataColumn = 'data';
  var moradaColumn = 'morada';
  var urlDaFotoColumn = 'urlDaFoto';
  var salarioColumn = 'salario';

  var sql = '''
    CREATE TABLE trabalhador (
      idTrabalhador INTEGER PRIMARY KEY AUTOINCREMENT,
      bi TEXT,
      nome TEXT,
      data DATE,
      morada TEXT,
      urlDaFoto TEXT,
      salario REAL
    );''';

  var sql2 = '''

    CREATE TABLE usuario (
      idUsuario INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      userName TEXT,
      senha TEXT,
      urlDaFoto TEXT
    );''';

  var sql3 = '''
    CREATE TABLE dinheiro (
      idDinheiro INTEGER PRIMARY KEY AUTOINCREMENT,
      entrada REAL,
      saida REAL,
      data DATETIME,
      idTrabalhador INTEGER,
      idDosAuxiliares TEXT
    );
    ''';

  Future<Database> open() async {
    var path = '${await getDatabasesPath()}${Platform.pathSeparator}dados.db';
    return openDatabase(
      path,
      version: 1,
      onUpgrade: (db, old, ne) {
        db.execute(sql);
        db.execute(sql2);
        db.execute(sql3);
      },
    );
  }

  Future<Either<Exception, List<DinheiroModel>>> todoODinheiro() async {
    var db = await open();
    try {
      var queryResult = await db.query(table);
      if (queryResult != null && queryResult.isNotEmpty) {
        var todoODinheiro =
            queryResult.map((d) => DinheiroModel.fromMap(d)).toList();
        return Right(todoODinheiro);
      } else {
        return Left(BDVazio());
      }
    } catch (e) {
      return Left(ErroInterno());
    }
  }

  Future<Either<Exception, bool>> registrarDinheiro(
    DinheiroModel dinheiroModel,
  ) async {
    var db = await open();
    try {
      await db.insert(table, dinheiroModel.toMap());
      return Right(true);
    } catch (e) {
      return Left(ErroInterno());
    }
  }

  Future<Either<Exception, List<DinheiroModel>>>
      buscarTodoODinheiroDoTrabalhador(
    int id,
  ) async {
    var db = await open();
    try {
      var queryResult = await db.query(table, where: 'idTrabalhador=?', whereArgs: [id]);
      if (queryResult != null && queryResult.isNotEmpty) {
        var todoDinheiroDoTrabalhador =
            queryResult.map((e) => DinheiroModel.fromMap(e)).toList();
        return Right(todoDinheiroDoTrabalhador);
      } else {
        return Left(ElementoNaoExistenteNaBD());
      }
    } catch (e) {
      return Left(ErroInterno());
    }
  }
}
