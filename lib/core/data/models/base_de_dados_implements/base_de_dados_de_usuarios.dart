import 'dart:io';

import 'package:control_do_dinheiro/core/data/erros/erros.dart';
import 'package:control_do_dinheiro/core/data/models/data_base.dart';
import 'package:control_do_dinheiro/core/data/models/usuario_model.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

class BaseDeDadosDeUsuariosImpl implements BaseDeDados<UsuarioModel> {
  var table = 'usuario';
  var idUsuarioColumn = 'idUsuario';
  var biColumn = 'bi';
  var nomeColumn = 'nome';
  var dataColumn = 'data';
  var moradaColumn = 'morada';
  var urlDaFotoColumn = 'urlDaFoto';

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
    ''';
  var sql2 = '''

    CREATE TABLE usuario (
      idUsuario INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      userName TEXT,
      senha TEXT,
      urlDaFoto TEXT
    );

    ''';
  var sql3 = '''

    CREATE TABLE dinheiro (
      idDinheiro INTEGER PRIMARY KEY AUTOINCREMENT,
      valorPresente REAL,
      valorTotal REAL,
      data DATETIME,
      idTrabalhador INTEGER
    );
    ''';

  Future<Database> open() async {
    var path = '${getDatabasesPath()}${Platform.pathSeparator}dados.db';
    return openDatabase(
      path,
      version: 3,
      onUpgrade: (db, old, ne) {
        db.execute(sql);
        db.execute(sql2);
        db.execute(sql3);
      },
    );
  }

  @override
  Future<Either<Exception, UsuarioModel>> buscarPorBi(String bi) async {
    var db = await open();
    try {
      var result = await db.query(table, where: 'bi=?', whereArgs: [bi]);
      if (result != null && result.isNotEmpty) {
        var usuario = UsuarioModel.fromMap(result.first);
        return Right(usuario);
      } else {
        return Left(ElementoNaoExistenteNaBD());
      }
    } catch (e) {
      return Left(e);
    } finally {
      await db.close();
    }
  }

  @override
  Future<Either<Exception, UsuarioModel>> buscarPorId(int id) async {
    var db = await open();
    try {
      var result = await db.query(table, where: 'id=?', whereArgs: [id]);
      if (result != null && result.isNotEmpty) {
        var usuario = UsuarioModel.fromMap(result.first);
        return Right(usuario);
      } else {
        return Left(ElementoNaoExistenteNaBD());
      }
    } catch (e) {
      return Left(e);
    } finally {
      await db.close();
    }
  }

  @override
  Future<Either<Exception, UsuarioModel>> buscarPorNome(String nome) async {
    var db = await open();
    try {
      var result = await db.query(table, where: 'nome=?', whereArgs: [nome]);
      if (result != null && result.isNotEmpty) {
        var usuario = UsuarioModel.fromMap(result.first);
        return Right(usuario);
      } else {
        return Left(ElementoNaoExistenteNaBD());
      }
    } catch (e) {
      return Left(e);
    } finally {
      await db.close();
    }
  }

  @override
  Future<Either<Exception, UsuarioModel>> eliminar(int id) async {
    var db = await open();
    var usuarioARemover = await buscarPorId(id);
    if (usuarioARemover != null && usuarioARemover is Right) {
      try {
        var result = await db.delete(table);
        if (result == 1) {
          return usuarioARemover;
        } else {
          return Left(ErroInterno());
        }
      } catch (e) {
        return Left(ElementoNaoExistenteNaBD());
      } finally {
        await db.close();
      }
    } else {
      return Left(ElementoNaoExistenteNaBD());
    }
  }

  @override
  Future<Either<Exception, List<UsuarioModel>>> getAll() async {
    var db = await open();
    try {
      var listOnMap = await db.query(table);
      if (listOnMap != null && listOnMap.isNotEmpty) {
        var usuarioModelList =
            listOnMap.map((map) => UsuarioModel.fromMap(map));
        return Right(usuarioModelList);
      } else {
        return Left(BDVazia());
      }
    } catch (e) {
      return Left(ErroInterno());
    } finally {
      await db.close();
    }
  }

  @override
  Future<Either<Exception, bool>> inserir(UsuarioModel t) async {
    var db = await open();
    try {
      var result = await db.insert(table, t.toMap());
      if (result >= 0) {
        return Right(true);
      } else {
        return Right(false);
      }
    } catch (e) {
      return Left(FalhaAoInserirNoBD());
    } finally {
      await db.close();
    }
  }
}
