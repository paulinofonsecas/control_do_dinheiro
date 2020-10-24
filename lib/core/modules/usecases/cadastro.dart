import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:control_do_dinheiro/core/modules/entitys/usuario.dart';
import 'package:control_do_dinheiro/core/modules/erros/entidades.dart';
import 'package:control_do_dinheiro/core/modules/repositorios/repositorio_de_trabalhadores.dart';
import 'package:control_do_dinheiro/core/modules/repositorios/repositorio_de_usuarios.dart';
import 'package:dartz/dartz.dart';

class Cadastrar{
  IRepositorioDeTrabalhadores _repositorioDeTrabalhadores;
  IRepositorioDeUsuarios _repositorioDeUsuarios;

  Cadastrar.trabalhador(this._repositorioDeTrabalhadores);
  Cadastrar.usuario(this._repositorioDeUsuarios);

  Future<Either<Exception, bool>> cadastrarTrabalhador(
    Trabalhador trabalhador,
  ) async {
    if (trabalhador != null) {
      var result = await _repositorioDeTrabalhadores.cadastrar(trabalhador);
      return result;
    } else {
      return Left(EntidadeNulla());
    }
  }

  Future<Either<Exception, bool>> cadastrarUsuario(Usuario usuario) async {
    if (usuario != null) {
      var result = await _repositorioDeUsuarios.cadastrar(usuario);
      return result;
    } else {
      return Left(EntidadeNulla());
    }
  }
}
