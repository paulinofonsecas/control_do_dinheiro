import 'package:control_do_dinheiro/core/data/datasource/datasource_trabalhadores.dart';
import 'package:control_do_dinheiro/core/data/datasource/datasource_usuarios.dart';
import 'package:control_do_dinheiro/core/data/models/base_de_dados_implements/base_de_dados_de_trabalhadores.dart';
import 'package:control_do_dinheiro/core/data/models/base_de_dados_implements/base_de_dados_de_usuarios.dart';
import 'package:control_do_dinheiro/core/data/repositorios/repositorio_de_trabalhadores.dart';
import 'package:control_do_dinheiro/core/data/repositorios/repositorio_de_usuarios.dart';
import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:control_do_dinheiro/core/modules/entitys/usuario.dart';
import 'package:control_do_dinheiro/core/modules/erros/entidades.dart';
import 'package:dartz/dartz.dart';

Future<Either<Exception, Usuario>> _getUsuarioPorId(int id) async {
  var _baseDeDados = BaseDeDadosDeUsuariosImpl();
  var _dataSource = DataSourceUsuarios(_baseDeDados);
  var _repositorioDeUsuarios = RepositorioDeUsuarios(_dataSource);
  var result = await _repositorioDeUsuarios.buscarUsuarioPorId(id);
  return result;
}

Future<Either<Exception, Usuario>> _getUsuarioPorBi(String bi) async {
  var _baseDeDados = BaseDeDadosDeUsuariosImpl();
  var _dataSource = DataSourceUsuarios(_baseDeDados);
  var _repositorioDeUsuarios = RepositorioDeUsuarios(_dataSource);
  var result = await _repositorioDeUsuarios.buscarUsuarioPorBi(bi);
  return result;
}

Future<Either<Exception, Usuario>> login(String nome, String senha) async {
  var _baseDeDados = BaseDeDadosDeUsuariosImpl();
  var _dataSource = DataSourceUsuarios(_baseDeDados);
  var _repositorioDeUsuarios = RepositorioDeUsuarios(_dataSource);
  var result = await _repositorioDeUsuarios.buscarUsuarioPorNome(nome);
  if (result is Right) {
    var usuario = result | null;

    var pass = usuario.senha;
    if (pass == senha) {
      return Right(usuario);
    } else {
      return Left(SenhaInvalida());
    }
  } else {
    return result;
  }
}

Future<Either<Exception, List<Trabalhador>>> todosTrabalhadores() async {
  var _dataBase = BaseDeDadosDeTrabalhadoresImpl();
  var _dataSource = DataSourceTrabalhador(_dataBase);
  var _repositorio = RepositorioDeTrabalhadores(_dataSource);
  var result = await _repositorio.buscarTodosOsTrabalhadores();
  return result;
}
