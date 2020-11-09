import 'package:control_do_dinheiro/core/data/datasource/datasource_dinheiro.dart';
import 'package:control_do_dinheiro/core/data/models/dinheiro_model.dart';
import 'package:control_do_dinheiro/core/modules/entitys/dinheiro.dart';
import 'package:control_do_dinheiro/core/modules/repositorios/i_repositorio_de_dinheiro.dart';
import 'package:dartz/dartz.dart';

class RepositorioDeDinheiro implements IRepositorioDeDinheiro {
  IDataSourceDinheiro _dataSource;

  @override
  Future<Either<Exception, List<Dinheiro>>>
      buscarTodoODinheiroAssociadoAoTrabalhador(int idTrabalhador) {
    return _dataSource.buscarTodoODinheiroAssociadoAoTrabalhador(idTrabalhador);
  }

  @override
  Future<Either<Exception, bool>> registrar(Dinheiro dinheiro) {
    var dinheiroModel = DinheiroModel.fromDinheiro(dinheiro);
    return _dataSource.registrar(dinheiroModel);
  }

  @override
  Future<Either<Exception, List<Dinheiro>>> todoODinheiro() async {
    var result = await _dataSource.todoODinheiro();
    var list = result | null;
    return Right(list.map((d) => d.toDinheiro()).toList());
  }
}
