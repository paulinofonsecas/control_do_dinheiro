import 'package:control_do_dinheiro/core/data/models/base_de_dados_implements/base_de_dados_de_usuarios.dart';
import 'package:control_do_dinheiro/core/data/models/usuario_model.dart';
import 'package:control_do_dinheiro/core/modules/entitys/usuario.dart';
import 'package:dartz/dartz.dart';

abstract class IDataSourceUsuarios {
  Future<Either<Exception, bool>> cadastrar(UsuarioModel usuario);
  Future<Either<Exception, UsuarioModel>> buscarUsuarioPorId(int id);
  Future<Either<Exception, UsuarioModel>> buscarUsuarioPorBi(String bi);
  Future<Either<Exception, UsuarioModel>> buscarUsuarioPorNome(String nome);
  Future<Either<Exception, UsuarioModel>> eliminarUmUsuario(int id);
  Future<Either<Exception, List<UsuarioModel>>> buscarTodosOsUsuarios();
}

class DataSourceUsuarios implements IDataSourceUsuarios {
  BaseDeDadosDeUsuariosImpl _baseDeDados;

  DataSourceUsuarios(this._baseDeDados);

  @override
  Future<Either<Exception, List<UsuarioModel>>> buscarTodosOsUsuarios() {
    return _baseDeDados.getAll();
  }

  @override
  Future<Either<Exception, UsuarioModel>> buscarUsuarioPorBi(String bi) {
    return _baseDeDados.buscarPorBi(bi);
  }

  @override
  Future<Either<Exception, UsuarioModel>> buscarUsuarioPorId(int id) {
    return _baseDeDados.buscarPorId(id);
  }

  @override
  Future<Either<Exception, UsuarioModel>> buscarUsuarioPorNome(String nome) {
    return _baseDeDados.buscarPorNome(nome);
  }

  @override
  Future<Either<Exception, bool>> cadastrar(UsuarioModel usuario) {
    return _baseDeDados.inserir(usuario);
  }

  @override
  Future<Either<Exception, UsuarioModel>> eliminarUmUsuario(int id) {
    return _baseDeDados.eliminar(id);
  }
}
