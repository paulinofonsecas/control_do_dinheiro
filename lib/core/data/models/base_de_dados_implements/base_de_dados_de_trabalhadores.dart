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

  Future<Database> open() async {
    var path = '${getDatabasesPath()}${Platform.pathSeparator}dados.db';
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db;
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
      var listMap = await db.query(table, where: 'id=?', whereArgs: [id]);
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

  Future<Either<Exception, TrabalhadorModel>> eliminar(
      int id) async {
    var db = await open();
    try {
      var trabalhadorPorEliminar = await buscarPorId(id);
      await db.delete(table, where: 'id=?', whereArgs: [id]);
      return Right(trabalhadorPorEliminar | null);
    } catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, List<TrabalhadorModel>>>
      getAll() async {
    var db = await open();
    try {
      var listInMap = await db.query(table);
      if (listInMap != null && listInMap.isNotEmpty) {
        var trabalhadorList =
            listInMap.map((map) => TrabalhadorModel.fromMap(map)).toList();
        return Right(trabalhadorList);
      } else {
        return Left(BDVazia());
      }
    } catch (e) {
      return Left(e);
    }
  }
}
