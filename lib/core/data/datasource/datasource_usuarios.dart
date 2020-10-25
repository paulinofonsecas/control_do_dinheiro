import 'package:control_do_dinheiro/core/data/datasource/datasource_trabalhadores.dart';
import 'package:control_do_dinheiro/core/data/models/base_de_dados_implements/base_de_dados_de_usuarios.dart';
import 'package:control_do_dinheiro/core/data/models/data_base.dart';
import 'package:control_do_dinheiro/core/data/models/trabalhador_model.dart';
import 'package:control_do_dinheiro/core/modules/entitys/usuario.dart';
import 'package:dartz/dartz.dart';

abstract class IDataSourceUsuarios {
  Future<Either<Exception, bool>> cadastrar(Usuario usuario);
  Future<Either<Exception, Usuario>> buscarUsuarioPorId(int id);
  Future<Either<Exception, Usuario>> buscarUsuarioPorBi(String bi);
  Future<Either<Exception, Usuario>> buscarUsuarioPorNome(String nome);
  Future<Either<Exception, Usuario>> eliminarUmUsuario(int id);
  Future<Either<Exception, List<Usuario>>> buscarTodosOsUsuarios();
}

class DataSourceUsuarios implements IDataSourceUsuarios {
  BaseDeDadosDeUsuariosImpl _baseDeDados;

  DataSourceUsuarios(this._baseDeDados);

  @override
  Future<Either<Exception, List<Usuario>>> buscarTodosOsUsuarios() {
    // TODO: implement buscarTodosOsUsuarios
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, Usuario>> buscarUsuarioPorBi(String bi) {
    // TODO: implement buscarUsuarioPorBi
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, Usuario>> buscarUsuarioPorId(int id) {
    // TODO: implement buscarUsuarioPorId
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, Usuario>> buscarUsuarioPorNome(String nome) {
    // TODO: implement buscarUsuarioPorNome
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, bool>> cadastrar(Usuario usuario) {
    // TODO: implement cadastrar
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, Usuario>> eliminarUmUsuario(int id) {
    // TODO: implement eliminarUmUsuario
    throw UnimplementedError();
  }

}
