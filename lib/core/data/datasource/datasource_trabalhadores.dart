import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:dartz/dartz.dart';

abstract class IDataSourceTrabalhadores {
  Future<Either<Exception, bool>> cadastrar(Trabalhador trabalhador);
  Future<Either<Exception, Trabalhador>> buscarTrabalhadorPorBi(String bi);
  Future<Either<Exception, Trabalhador>> buscarTrabalhadorPorNome(String nome);
  Future<Either<Exception, Trabalhador>> eliminarUmTrabalhador(String bi);
  Future<Either<Exception, List<Trabalhador>>> buscarTodosOsTrabalhadores();
}

class DataSourceTrabalhadores implements IDataSourceTrabalhadores {
  @override
  Future<Either<Exception, List<Trabalhador>>> buscarTodosOsTrabalhadores() {}

  @override
  Future<Either<Exception, Trabalhador>> buscarTrabalhadorPorBi(String bi) {}
  Future<Either<Exception, Trabalhador>> buscarTrabalhadorPorNome(
      String nome) {}

  @override
  Future<Either<Exception, bool>> cadastrar(Trabalhador trabalhador) {}

  @override
  Future<Either<Exception, Trabalhador>> eliminarUmTrabalhador(String bi) {}
}
