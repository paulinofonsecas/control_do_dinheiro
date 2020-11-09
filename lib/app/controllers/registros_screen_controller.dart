import 'package:control_do_dinheiro/app/pages/home_page/componentes/registro_item.dart';
import 'package:control_do_dinheiro/app/pages/registrar_venda/registrar_venda_page.dart';
import 'package:control_do_dinheiro/core/data/datasource/datasource_dinheiro.dart';
import 'package:control_do_dinheiro/core/data/datasource/datasource_trabalhadores.dart';
import 'package:control_do_dinheiro/core/data/models/base_de_dados_implements/base_de_dados_de_trabalhadores.dart';
import 'package:control_do_dinheiro/core/data/models/base_de_dados_implements/base_de_dados_do_dinheiro.dart';
import 'package:control_do_dinheiro/core/data/repositorios/repositorio_de_dinheiro.dart';
import 'package:control_do_dinheiro/core/data/repositorios/repositorio_de_trabalhadores.dart';
import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:control_do_dinheiro/core/modules/repositorios/i_repositorio_de_dinheiro.dart';
import 'package:control_do_dinheiro/core/modules/repositorios/i_repositorio_de_trabalhadores.dart';
import 'package:flutter/material.dart';

class RegistrosScreenController {
  IRepositorioDeTrabalhadores _repositorioDeTrabalhadores;
  IRepositorioDeDinheiro _repositorioDeDinheiro;

  BuildContext context;

  RegistrosScreenController(this.context) {
    configuracaoDoRepositorioDoDinheiro();
    configuracaoDoRepositorioDeTrabalhadores();
  }

  Future<List<Registro>> registros() async {
    var result = await _repositorioDeDinheiro.todoODinheiro();
    var dinheiroList = result | [];
    List<Registro> regis = [];

    for (var dinheiro in dinheiroList) {
      var trabalhadorSearch = await _repositorioDeTrabalhadores
          .buscarTrabalhadorPorId(dinheiro.idTrabalhador);
      var trabalhador = trabalhadorSearch | null;

      List<Trabalhador> auxialiares = [];

      dinheiro.idDosAuxiliares.forEach((id) async {
        var temp = await _repositorioDeTrabalhadores
            .buscarTrabalhadorPorId(id);
        var trabalhador = temp | null;
        auxialiares.add(trabalhador);
      });

      regis.add(Registro(
        trabalhador: trabalhador,
        trabalhadoresAuxiliares: auxialiares,
        nomeDoFuncionario: trabalhador.nome,
        entrada: dinheiro.entrada,
        saida: dinheiro.saida,
        dateTime: dinheiro.data,
      ));
    }
    regis.sort((r1, r2) => r1.dateTime.compareTo(r2.dateTime));
    return regis.reversed.toList();
  }

  void configuracaoDoRepositorioDeTrabalhadores() {
    BaseDeDadosDeTrabalhadoresImpl _baseDeDados =
        BaseDeDadosDeTrabalhadoresImpl();
    IDataSourceTrabalhador _dataSource = DataSourceTrabalhador(_baseDeDados);
    _repositorioDeTrabalhadores = RepositorioDeTrabalhadores(_dataSource);
  }

  void configuracaoDoRepositorioDoDinheiro() {
    BaseDeDadosDoDinheiro _baseDeDados = BaseDeDadosDoDinheiro();
    IDataSourceDinheiro _dataSource = DataSourceDinheiro(_baseDeDados);
    _repositorioDeDinheiro = RepositorioDeDinheiro(_dataSource);
  }

  void registrarVenda() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegistrarVenda(),
      ),
    );
  }
}
