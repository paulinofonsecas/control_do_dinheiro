import 'package:control_do_dinheiro/app/componenets/mensagem.dart';
import 'package:control_do_dinheiro/app/pages/home_page/home_page.dart';
import 'package:control_do_dinheiro/core/data/datasource/datasource_dinheiro.dart';
import 'package:control_do_dinheiro/core/data/datasource/datasource_trabalhadores.dart';
import 'package:control_do_dinheiro/core/data/models/base_de_dados_implements/base_de_dados_de_trabalhadores.dart';
import 'package:control_do_dinheiro/core/data/models/base_de_dados_implements/base_de_dados_do_dinheiro.dart';
import 'package:control_do_dinheiro/core/data/repositorios/repositorio_de_dinheiro.dart';
import 'package:control_do_dinheiro/core/data/repositorios/repositorio_de_trabalhadores.dart';
import 'package:control_do_dinheiro/core/modules/entitys/dinheiro.dart';
import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:control_do_dinheiro/core/modules/repositorios/i_repositorio_de_dinheiro.dart';
import 'package:control_do_dinheiro/core/modules/repositorios/i_repositorio_de_trabalhadores.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrarVendaController {
  BuildContext context;
  IRepositorioDeTrabalhadores _repositorioDeTrabalhadores;
  IRepositorioDeDinheiro _repositorioDeDinheiro;

  Trabalhador trabalhadorPrincipal;
  List<Trabalhador> trabalhadoresSelecionados = [];
  List<Trabalhador> trabalhadores;

  TextEditingController entradaController;
  TextEditingController saidaController;

  RegistrarVendaController(this.context) {
    entradaController = TextEditingController();
    saidaController = TextEditingController();
    configuracaoDoRepositorioDeTrabalhadores();
    configuracaoDoRepositorioDoDinheiro();
  }

  void configuracaoDoRepositorioDoDinheiro() {
    BaseDeDadosDoDinheiro _baseDeDados = BaseDeDadosDoDinheiro();
    IDataSourceDinheiro _dataSource = DataSourceDinheiro(_baseDeDados);
    _repositorioDeDinheiro = RepositorioDeDinheiro(_dataSource);
  }

  void configuracaoDoRepositorioDeTrabalhadores() {
    BaseDeDadosDeTrabalhadoresImpl _baseDeDados =
        BaseDeDadosDeTrabalhadoresImpl();
    IDataSourceTrabalhador _dataSource = DataSourceTrabalhador(_baseDeDados);
    _repositorioDeTrabalhadores = RepositorioDeTrabalhadores(_dataSource);
  }

  Future<List<Trabalhador>> get getTrabalhadores async {
    var result = await _repositorioDeTrabalhadores.buscarTodosOsTrabalhadores();
    if (result is Right) {
      return result | null;
    } else {
      return [];
    }
  }

  registrar() async {
    var idTrabalhadoresAuxiliares =
        trabalhadoresSelecionados.map((t) => t.idTrabalhador).toList();
    var entrada = double.parse(entradaController.text);
    var saida = double.parse(saidaController.text);
    var dinheiroARegistrar = Dinheiro(
      idTrabalhador: trabalhadorPrincipal.idTrabalhador,
      idDosAuxiliares: idTrabalhadoresAuxiliares,
      entrada: entrada,
      saida: saida,
      data: DateTime.now(),
    );
    var result = await _repositorioDeDinheiro.registrar(dinheiroARegistrar);
    var confirmacao = result | false;
    if (confirmacao) {
      await showDialog(
        context: context,
        builder: (context) {
          return Mensagem(
            mensagem: 'Registro feito com sucesso!',
            icon: Icon(
              Icons.verified,
              size: 120,
              color: Colors.green,
            ),
          );
        },
      );
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) {
            return HomePage();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    } else {
      await showDialog(
        context: context,
        builder: (context) {
          return Mensagem(
            mensagem: 'Ocorreu um erro ao registrar a venda',
            icon: Icon(
              Icons.error_outline,
              size: 120,
              color: Colors.red,
            ),
          );
        },
      );
    }
  }

  sair() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return HomePage();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }
}
