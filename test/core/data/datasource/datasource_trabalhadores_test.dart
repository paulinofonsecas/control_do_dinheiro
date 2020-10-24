import 'package:control_do_dinheiro/core/data/datasource/datasource_trabalhadores.dart';
import 'package:control_do_dinheiro/core/data/erros/erros.dart';
import 'package:control_do_dinheiro/core/data/models/trabalhador_model.dart';
import 'package:control_do_dinheiro/core/data/repositorios/repositorio_de_trabalhadores.dart';
import 'package:control_do_dinheiro/core/modules/erros/entidades.dart';
import 'package:control_do_dinheiro/core/modules/repositorios/i_repositorio_de_trabalhadores.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DataBaseImplMock extends Mock implements DataBaseImpl {}

void main() {
  IDataSourceTrabalhador _repositorio;
  DataBaseImpl _dataBase;

  setUpAll(() {
    _dataBase = DataBaseImplMock();
    _repositorio = DataSourceTrabalhador(_dataBase);
  });

  group('Inserção de trabalhador', () {
    test('Inserir trabalhadores', () async {
      when(_dataBase.inserir(any)).thenAnswer((_) async => Right(true));
      var result = await _repositorio.cadastrar(TrabalhadorModel());
      expect(result | false, true);
    });

    test('Erro ao Inserir trabalhadores', () async {
      when(_dataBase.inserir(any)).thenAnswer((_) async => Left(FalhaAoInserirNoBD()));
      var result = await _repositorio.cadastrar(TrabalhadorModel());
      expect(result.swap() | null, isA<FalhaAoInserirNoBD>());
    });
  });
}
