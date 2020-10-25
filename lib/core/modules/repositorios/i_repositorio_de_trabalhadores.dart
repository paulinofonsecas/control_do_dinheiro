import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:dartz/dartz.dart';

abstract class IRepositorioDeTrabalhadores {
  Future<Either<Exception, bool>> cadastrar(Trabalhador trabalhador);
  Future<Either<Exception, Trabalhador>> buscarTrabalhadorPorId(int id);
  Future<Either<Exception, Trabalhador>> buscarTrabalhadorPorBi(String bi);
  Future<Either<Exception, Trabalhador>> buscarTrabalhadorPorNome(String nome);
  Future<Either<Exception, Trabalhador>> eliminarUmTrabalhador(int id);
  Future<Either<Exception, List<Trabalhador>>> buscarTodosOsTrabalhadores();
}
