
import 'package:control_do_dinheiro/core/data/models/base_de_dados_implements/base_de_dados_de_trabalhadores.dart';
import 'package:control_do_dinheiro/core/data/models/trabalhador_model.dart';
import 'package:dartz/dartz.dart';

abstract class IDataSourceTrabalhador {
  Future<Either<Exception, bool>> cadastrar(
    TrabalhadorModel trabalhadorModel,
  );
  Future<Either<Exception, TrabalhadorModel>> buscarTrabalhadorPorId(
    int id,
  );
  Future<Either<Exception, TrabalhadorModel>> buscarTrabalhadorPorBi(
    String bi,
  );
  Future<Either<Exception, TrabalhadorModel>> buscarTrabalhadorPorNome(
    String nome,
  );
  Future<Either<Exception, TrabalhadorModel>> eliminarUmTrabalhador(
    int id,
  );
  Future<Either<Exception, List<TrabalhadorModel>>>
      buscarTodosOsTrabalhadores();
}

class DataSourceTrabalhador implements IDataSourceTrabalhador {
  BaseDeDadosDeTrabalhadoresImpl _dataBase;

  DataSourceTrabalhador(this._dataBase);

  @override
  Future<Either<Exception, List<TrabalhadorModel>>>
      buscarTodosOsTrabalhadores() async {
    return _dataBase.getAll();
  }

  @override
  Future<Either<Exception, TrabalhadorModel>> buscarTrabalhadorPorId(
      int id) async {
    return _dataBase.buscarPorId(id);
  }

  @override
  Future<Either<Exception, TrabalhadorModel>> buscarTrabalhadorPorBi(
      String bi) async {
    return _dataBase.buscarPorBi(bi);
  }

  Future<Either<Exception, TrabalhadorModel>> buscarTrabalhadorPorNome(
      String nome) {
    return _dataBase.buscarPorNome(nome);
  }

  @override
  Future<Either<Exception, bool>> cadastrar(TrabalhadorModel trabalhadorModel) {
    return _dataBase.inserir(trabalhadorModel);
  }

  @override
  Future<Either<Exception, TrabalhadorModel>> eliminarUmTrabalhador(int id) {
    return _dataBase.eliminar(id);
  }
}

