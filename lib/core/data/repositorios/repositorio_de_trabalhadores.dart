import 'package:control_do_dinheiro/core/data/datasource/datasource_trabalhadores.dart';
import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:control_do_dinheiro/core/modules/repositorios/i_repositorio_de_trabalhadores.dart';
import 'package:dartz/dartz.dart';
import 'package:control_do_dinheiro/core/modules/utils/forma_de_busca.dart';

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
  Future<Either<Exception, Trabalhador>> buscarTrabalhadorPor(
      Trabalhador trabalhador, FormaDeBusca formaDeBusca) async {
    switch (formaDeBusca) {
      case FormaDeBusca.id:
        return _dataSource.buscarTrabalhadorPorId(trabalhador.idTrabalhador);
      case FormaDeBusca.bi:
        return _dataSource.buscarTrabalhadorPorBi(trabalhador.bi);
        break;
      case FormaDeBusca.nome:
        return _dataSource.buscarTrabalhadorPorNome(trabalhador.nome);
        break;
      default:
        return null;
    }
  }

  @override
  Future<Either<Exception, bool>> cadastrar(Trabalhador trabalhador) {
    return _dataSource.cadastrar(trabalhador);
  }

  @override
  Future<Either<Exception, Trabalhador>> eliminarUmTrabalhador(int id) {
    return _dataSource.eliminarUmTrabalhador(id);
  }
}
