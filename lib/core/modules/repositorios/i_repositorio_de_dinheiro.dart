import 'package:control_do_dinheiro/core/modules/entitys/dinheiro.dart';
import 'package:dartz/dartz.dart';

abstract class IRepositorioDeDinheiro {
  Future<Either<Exception, bool>> registrar(Dinheiro dinheiro);
  Future<Either<Exception, List<Dinheiro>>>
      buscarTodoODinheiroAssociadoAoTrabalhador(
    int idTrabalhador,
  );
  Future<Either<Exception, List<Dinheiro>>> todoODinheiro();
}
