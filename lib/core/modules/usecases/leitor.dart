import 'package:control_do_dinheiro/core/data/datasource/datasource_usuarios.dart';
import 'package:control_do_dinheiro/core/data/models/base_de_dados_implements/base_de_dados_de_usuarios.dart';
import 'package:control_do_dinheiro/core/data/repositorios/repositorio_de_usuarios.dart';
import 'package:control_do_dinheiro/core/modules/entitys/usuario.dart';
import 'package:dartz/dartz.dart';

Future<Either<Exception, Usuario>> getUsuarioPorId(int id) async {
  var _baseDeDados = BaseDeDadosDeUsuariosImpl();
  var _dataSource = DataSourceUsuarios(_baseDeDados);
  var _repositorioDeUsuarios = RepositorioDeUsuarios(_dataSource);
  var result = await _repositorioDeUsuarios.buscarUsuarioPorId(id);
  return result;
}

Future<Either<Exception, Usuario>> getUsuarioPorBi(String bi) async {
  var _baseDeDados = BaseDeDadosDeUsuariosImpl();
  var _dataSource = DataSourceUsuarios(_baseDeDados);
  var _repositorioDeUsuarios = RepositorioDeUsuarios(_dataSource);
  var result = await _repositorioDeUsuarios.buscarUsuarioPorBi(bi);
  return result;
}

Future<Either<Exception, Usuario>> getUsuarioPorNom(String nome) async {
  var _baseDeDados = BaseDeDadosDeUsuariosImpl();
  var _dataSource = DataSourceUsuarios(_baseDeDados);
  var _repositorioDeUsuarios = RepositorioDeUsuarios(_dataSource);
  var result = await _repositorioDeUsuarios.buscarUsuarioPorNome(nome);
  return result;
}
