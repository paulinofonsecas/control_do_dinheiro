import 'package:control_do_dinheiro/core/data/datasource/datasource_trabalhadores.dart';
import 'package:control_do_dinheiro/core/data/models/trabalhador_model.dart';
import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:control_do_dinheiro/core/modules/repositorios/i_repositorio_de_trabalhadores.dart';
import 'package:dartz/dartz.dart';

class RepositorioDeTrabalhadores implements IRepositorioDeTrabalhadores {
  IDataSourceTrabalhador _dataSource;

  RepositorioDeTrabalhadores(this._dataSource);

  @override
  Future<Either<Exception, List<Trabalhador>>>
      buscarTodosOsTrabalhadores() async {
    Either<Exception, List<Trabalhador>> result =
        await _dataSource.buscarTodosOsTrabalhadores();
    return result;
  }

  @override
  Future<Either<Exception, Trabalhador>> buscarTrabalhadorPorId(int id) {
    return _dataSource.buscarTrabalhadorPorId(id);
  }

  @override
  Future<Either<Exception, Trabalhador>> buscarTrabalhadorPorBi(String bi) {
    return _dataSource.buscarTrabalhadorPorBi(bi);
  }

  @override
  Future<Either<Exception, Trabalhador>> buscarTrabalhadorPorNome(String nome) {
    return _dataSource.buscarTrabalhadorPorNome(nome);
  }

  @override
  Future<Either<Exception, bool>> cadastrar(Trabalhador trabalhador) {
    return _dataSource.cadastrar(TrabalhadorModel.fromTrabalhador(trabalhador));
  }

  @override
  Future<Either<Exception, Trabalhador>> eliminarUmTrabalhador(int id) {
    return _dataSource.eliminarUmTrabalhador(id);
  }
}
