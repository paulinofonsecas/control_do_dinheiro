import 'package:control_do_dinheiro/core/modules/entitys/usuario.dart';
import 'package:dartz/dartz.dart';

abstract class IRepositorioDeUsuarios {
  Future<Either<Exception, bool>> cadastrar(Usuario usuario);
  Future<Either<Exception, Usuario>> buscarUsuarioPorId(int id);
  Future<Either<Exception, Usuario>> buscarUsuarioPorBi(String bi);
  Future<Either<Exception, Usuario>> buscarUsuarioPorNome(String nome);
  Future<Either<Exception, Usuario>> eliminarUmUsuario(int id);
  Future<Either<Exception, List<Usuario>>> buscarTodosOsUsuarios();
}
