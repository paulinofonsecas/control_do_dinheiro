import 'package:control_do_dinheiro/core/data/models/base_de_dados_implements/base_de_dados_do_dinheiro.dart';
import 'package:control_do_dinheiro/core/data/models/dinheiro_model.dart';
import 'package:dartz/dartz.dart';

abstract class IDataSourceDinheiro {
  Future<Either<Exception, bool>> registrar(DinheiroModel dinheiro);
  Future<Either<Exception, List<DinheiroModel>>>
      buscarTodoODinheiroAssociadoAoTrabalhador(
    int idTrabalhador,
  );
  Future<Either<Exception, List<DinheiroModel>>> todoODinheiro();
}

class DataSourceDinheiro implements IDataSourceDinheiro {
  BaseDeDadosDoDinheiro _baseDeDados;

  DataSourceDinheiro(this._baseDeDados);

  @override
  Future<Either<Exception, List<DinheiroModel>>>
      buscarTodoODinheiroAssociadoAoTrabalhador(int idTrabalhador) {
    return _baseDeDados.buscarTodoODinheiroDoTrabalhador(idTrabalhador);
  }

  @override
  Future<Either<Exception, bool>> registrar(DinheiroModel dinheiro) {
    return _baseDeDados.registrarDinheiro(dinheiro);
  }

  @override
  Future<Either<Exception, List<DinheiroModel>>> todoODinheiro() {
    return _baseDeDados.todoODinheiro();
  }
}
