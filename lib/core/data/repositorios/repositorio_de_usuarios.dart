import 'package:control_do_dinheiro/core/data/datasource/datasource_usuarios.dart';
import 'package:control_do_dinheiro/core/modules/entitys/usuario.dart';
import 'package:control_do_dinheiro/core/modules/repositorios/i_repositorio_de_usuarios.dart';
import 'package:dartz/dartz.dart';

class RepositorioDeUsuarios implements IRepositorioDeUsuarios {
  IDataSourceUsuarios _dataSource;

  RepositorioDeUsuarios(this._dataSource);

  @override
  Future<Either<Exception, List<Usuario>>> buscarTodosOsUsuarios() async {
    Either<Exception, List<Usuario>> listaDeUsuarios =
        await _dataSource.buscarTodosOsUsuarios();
    return listaDeUsuarios;
  }

  @override
  Future<Either<Exception, Usuario>> buscarUsuarioPorId(int id) async {
    return _dataSource.buscarUsuarioPorId(id);
  }

  Future<Either<Exception, Usuario>> buscarUsuarioPorBi(String bi) {
    return _dataSource.buscarUsuarioPorBi(bi);
  }

  Future<Either<Exception, Usuario>> buscarUsuarioPorNome(String nome) {
    return _dataSource.buscarUsuarioPorNome(nome);
  }

  @override
  Future<Either<Exception, bool>> cadastrar(Usuario usuario) {
    return _dataSource.cadastrar(usuario);
  }

  @override
  Future<Either<Exception, Usuario>> eliminarUmUsuario(int id) {
    return _dataSource.eliminarUmUsuario(id);
  }
}
