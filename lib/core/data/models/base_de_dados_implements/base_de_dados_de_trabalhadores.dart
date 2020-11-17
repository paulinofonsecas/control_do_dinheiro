import 'dart:io';

import 'package:control_do_dinheiro/core/data/erros/erros.dart';
import 'package:control_do_dinheiro/core/data/models/trabalhador_model.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

import '../data_base.dart';

class BaseDeDadosDeTrabalhadoresImpl implements BaseDeDados<TrabalhadorModel> {
  BaseDeDadosDeTrabalhadoresImpl();

  var table = 'trabalhador ';
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

  Future<Either<Exception, bool>> inserir(
      TrabalhadorModel trabalhadorModel) async {
    var db = await open();
    try {
      await db.insert(table, trabalhadorModel.toMap(),
          conflictAlgorithm: ConflictAlgorithm.abort);
      return Right(true);
    } catch (e) {
      return Left(FalhaAoInserirNoBD());
    }
  }

  Future<Either<Exception, TrabalhadorModel>> buscarPorId(int id) async {
    var db = await open();
    try {
      var listMap =
          await db.query(table, where: 'idTrabalhador=?', whereArgs: [id]);
      if (listMap != null && listMap.isNotEmpty) {
        var trabalhadorModel = TrabalhadorModel.fromMap(listMap.first);
        return Right(trabalhadorModel);
      } else {
        return Left(ElementoNaoExistenteNaBD());
      }
    } catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, TrabalhadorModel>> buscarPorBi(String bi) async {
    var db = await open();
    try {
      var listMap = await db.query(table, where: 'bi=?', whereArgs: [bi]);
      if (listMap != null && listMap.isNotEmpty) {
        var trabalhadorModel = TrabalhadorModel.fromMap(listMap.first);
        return Right(trabalhadorModel);
      } else {
        return Left(ElementoNaoExistenteNaBD());
      }
    } catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, TrabalhadorModel>> buscarPorNome(String nome) async {
    var db = await open();
    try {
      var listMap = await db.query(table, where: 'nome=?', whereArgs: [nome]);
      if (listMap != null && listMap.isNotEmpty) {
        var trabalhadorModel = TrabalhadorModel.fromMap(listMap.first);
        return Right(trabalhadorModel);
      } else {
        return Left(ElementoNaoExistenteNaBD());
      }
    } catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, TrabalhadorModel>> eliminar(int id) async {
    var db = await open();
    try {
      var trabalhadorPorEliminar = await buscarPorId(id);
      await db.delete(table, where: 'id=?', whereArgs: [id]);
      return Right(trabalhadorPorEliminar | null);
    } catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, List<TrabalhadorModel>>> getAll() async {
    var db = await open();
    try {
      var listInMap = await db.query(table);
      if (listInMap != null && listInMap.isNotEmpty) {
        var trabalhadorList =
            listInMap.map((map) => TrabalhadorModel.fromMap(map)).toList();
        return Right(trabalhadorList);
      } else {
        return Left(BDVazio());
      }
    } catch (e) {
      return Left(e);
    }
  }
}
