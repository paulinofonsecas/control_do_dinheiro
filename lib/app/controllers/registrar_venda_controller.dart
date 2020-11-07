import 'package:control_do_dinheiro/core/data/datasource/datasource_trabalhadores.dart';
import 'package:control_do_dinheiro/core/data/models/base_de_dados_implements/base_de_dados_de_trabalhadores.dart';
import 'package:control_do_dinheiro/core/data/repositorios/repositorio_de_trabalhadores.dart';
import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:control_do_dinheiro/core/modules/repositorios/i_repositorio_de_trabalhadores.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class RegistrarVendaController {
  IRepositorioDeTrabalhadores _repositorioDeTrabalhadores;
  BuildContext context;

  RegistrarVendaController(this.context) {
    BaseDeDadosDeTrabalhadoresImpl _baseDeDados =
        BaseDeDadosDeTrabalhadoresImpl();
    IDataSourceTrabalhador _dataSource = DataSourceTrabalhador(_baseDeDados);
    _repositorioDeTrabalhadores = RepositorioDeTrabalhadores(_dataSource);
  }

  Future<List<Trabalhador>> get trabalhadores async {
    var result = await _repositorioDeTrabalhadores.buscarTodosOsTrabalhadores();
    if (result is Right) {
      return result | null;
    } else {
      return [];
    }
  }
}
