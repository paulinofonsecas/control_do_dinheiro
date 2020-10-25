import 'package:control_do_dinheiro/core/data/datasource/datasource_trabalhadores.dart';
import 'package:control_do_dinheiro/core/data/erros/erros.dart';
import 'package:control_do_dinheiro/core/data/models/base_de_dados_implements/base_de_dados_de_trabalhadores.dart';
import 'package:control_do_dinheiro/core/data/models/data_base.dart';
import 'package:control_do_dinheiro/core/data/models/trabalhador_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DataBaseImplMock extends Mock implements BaseDeDadosDeTrabalhadoresImpl {}

void main() {
  IDataSourceTrabalhador _dataSource;
  BaseDeDados _dataBase;

  setUpAll(() {
    _dataBase = DataBaseImplMock();
    _dataSource = DataSourceTrabalhador(_dataBase);
  });

  group('Inserção de trabalhador', () {
    test('Inserir trabalhadores', () async {
      when(_dataBase.inserir(any)).thenAnswer((_) async => Right(true));
      var result = await _dataSource.cadastrar(TrabalhadorModel());
      expect(result | false, true);
    });

    test('Erro ao Inserir trabalhadores', () async {
      when(_dataBase.inserir(any))
          .thenAnswer((_) async => Left(FalhaAoInserirNoBD()));
      var result = await _dataSource.cadastrar(TrabalhadorModel());
      expect(result.swap() | null, isA<FalhaAoInserirNoBD>());
    });
  });

  group('Eliminar trabalhador', () {
    test('Sucesso ao eliminar um trabalhador', () async {
      when(_dataSource.eliminarUmTrabalhador(any)).thenAnswer(
          (_) async => Right(TrabalhadorModel(nome: 'Trabalhador')));
      var result = await _dataSource.eliminarUmTrabalhador(0);
      expect(result, isA<Right>());
      var trab = result | null;
      expect(trab.nome, 'Trabalhador');
    });
  });
}
