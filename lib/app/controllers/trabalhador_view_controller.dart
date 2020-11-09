import 'package:control_do_dinheiro/app/pages/home_page/componentes/registro_item.dart';
import 'package:control_do_dinheiro/core/data/datasource/datasource_dinheiro.dart';
import 'package:control_do_dinheiro/core/data/models/base_de_dados_implements/base_de_dados_do_dinheiro.dart';
import 'package:control_do_dinheiro/core/data/repositorios/repositorio_de_dinheiro.dart';
import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:control_do_dinheiro/core/modules/repositorios/i_repositorio_de_dinheiro.dart';
import 'package:flutter/material.dart';

class TrabalhadorViewController {
  IRepositorioDeDinheiro _repositorioDeDinheiro;
  BuildContext context;

  TrabalhadorViewController(this.context) {
    configuracaoDoRepositorioDoDinheiro();
  }

  void configuracaoDoRepositorioDoDinheiro() {
    BaseDeDadosDoDinheiro _baseDeDados = BaseDeDadosDoDinheiro();
    IDataSourceDinheiro _dataSource = DataSourceDinheiro(_baseDeDados);
    _repositorioDeDinheiro = RepositorioDeDinheiro(_dataSource);
  }

  Future<List<Registro>> registros(Trabalhador trabalhador) async {
    var result =
        await _repositorioDeDinheiro.buscarTodoODinheiroAssociadoAoTrabalhador(
      trabalhador.idTrabalhador,
    );
    var registros = result | [];
    var temp = registros.map((e) {
      return Registro(
        trabalhador: trabalhador,
        nomeDoFuncionario: trabalhador.nome,
        entrada: e.entrada,
        saida: e.saida,
        dateTime: e.data,
      );
    }).toList();
    temp.sort((e1, e2) => e1.dateTime.compareTo(e2.dateTime));
    return temp.reversed.toList();
  }

  void sair() {
    Navigator.pop(context);
  }
}
