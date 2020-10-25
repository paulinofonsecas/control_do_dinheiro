import 'package:control_do_dinheiro/core/modules/entitys/usuario.dart';
import 'package:control_do_dinheiro/core/utils/forma_de_busca.dart';
import 'package:dartz/dartz.dart';

abstract class IRepositorioDeUsuarios {
  Future<Either<Exception, bool>> cadastrar(Usuario usuario);
  Future<Either<Exception, Usuario>> buscarUsuarioPor(
    Usuario usuario,
    FormaDeBusca formaDeBusca,
  );
  Future<Either<Exception, Usuario>> eliminarUmUsuario(int id);
  Future<Either<Exception, List<Usuario>>> buscarTodosOsUsuarios();
}
