import 'package:control_do_dinheiro/core/data/datasource/datasource_usuarios.dart';
import 'package:control_do_dinheiro/core/modules/entitys/usuario.dart';
import 'package:control_do_dinheiro/core/modules/repositorios/i_repositorio_de_usuarios.dart';
import 'package:dartz/dartz.dart';
import 'package:control_do_dinheiro/core/utils/forma_de_busca.dart';

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
  Future<Either<Exception, Usuario>> buscarUsuarioPor(
      Usuario usuario, FormaDeBusca formaDeBusca) async {
    switch (formaDeBusca) {
      case FormaDeBusca.id:
        return _dataSource.buscarUsuarioPorId(usuario.idUsuario);
        break;
      case FormaDeBusca.bi:
        return _dataSource.buscarUsuarioPorBi(usuario.bi);
        break;
      case FormaDeBusca.nome:
        return _dataSource.buscarUsuarioPorNome(usuario.nome);
        break;
      default:
        return null;
    }
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
