import 'package:control_do_dinheiro/core/data/models/base_de_dados_implements/base_de_dados_de_usuarios.dart';
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
    return _baseDeDados.getAll();
  }

  @override
  Future<Either<Exception, Usuario>> buscarUsuarioPorBi(String bi) {
    return _baseDeDados.buscarPorBi(bi);
  }

  @override
  Future<Either<Exception, Usuario>> buscarUsuarioPorId(int id) {
    return _baseDeDados.buscarPorId(id);
  }

  @override
  Future<Either<Exception, Usuario>> buscarUsuarioPorNome(String nome) {
    return _baseDeDados.buscarPorNome(nome);
  }

  @override
  Future<Either<Exception, bool>> cadastrar(Usuario usuario) {
    return _baseDeDados.inserir(usuario);
  }

  @override
  Future<Either<Exception, Usuario>> eliminarUmUsuario(int id) {
    return _baseDeDados.eliminar(id);
  }
}
