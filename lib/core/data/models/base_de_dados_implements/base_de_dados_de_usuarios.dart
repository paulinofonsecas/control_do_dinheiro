import 'dart:io';

import 'package:control_do_dinheiro/core/data/models/data_base.dart';
import 'package:control_do_dinheiro/core/data/models/usuario_model.dart';
import 'package:control_do_dinheiro/core/modules/entitys/usuario.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

class BaseDeDadosDeUsuariosImpl implements BaseDeDados<UsuarioModel>{
  var table = 'usuario';
  var idUsuarioColumn = 'idUsuario';
  var biColumn = 'bi';
  var nomeColumn = 'nome';
  var dataColumn = 'data';
  var moradaColumn = 'morada';
  var urlDaFotoColumn = 'urlDaFoto';

  Future<Database> open() async {
    var path = '${getDatabasesPath()}${Platform.pathSeparator}dados.db';
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db;
      },
    );
  }

  @override
  Future<Either<Exception, UsuarioModel>> buscarPorBi(String bi) {
    // TODO: implement buscarPorBi
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, UsuarioModel>> buscarPorId(int id) {
    // TODO: implement buscarPorId
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, UsuarioModel>> buscarPorNome(String nome) {
    // TODO: implement buscarPorNome
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, UsuarioModel>> eliminar(int id) {
    // TODO: implement eliminar
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, List<UsuarioModel>>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, bool>> inserir(UsuarioModel t) {
    // TODO: implement inserir
    throw UnimplementedError();
  }

}