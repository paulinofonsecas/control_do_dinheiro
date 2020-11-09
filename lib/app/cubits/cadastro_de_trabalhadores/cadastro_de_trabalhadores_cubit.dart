import 'package:control_do_dinheiro/app/componenets/mensagem.dart';
import 'package:control_do_dinheiro/app/cubits/cadastro_de_usuario/cadastro_de_usuario_cubit.dart';
import 'package:control_do_dinheiro/core/data/datasource/datasource_trabalhadores.dart';
import 'package:control_do_dinheiro/core/data/models/base_de_dados_implements/base_de_dados_de_trabalhadores.dart';
import 'package:control_do_dinheiro/core/data/repositorios/repositorio_de_trabalhadores.dart';
import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:control_do_dinheiro/core/modules/usecases/cadastro.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CadastroDeTrabalhadoresCubit extends Cubit<EstadoDeForulario> {
  TextEditingController biController;
  TextEditingController nomeController;
  TextEditingController moradaController;
  TextEditingController salarioController;
  String _urlDaImagem;
  DateTime dateTime;
  BuildContext context;

  CadastroDeTrabalhadoresCubit(this.context)
      : super(EstadoDeForulario.inicial) {
    nomeController = TextEditingController();
    biController = TextEditingController();
    moradaController = TextEditingController();
    salarioController = TextEditingController();
  }

  String get nome => nomeController.text;
  String get bi => biController.text;
  String get morada => moradaController.text;
  double get salario => double.parse(salarioController.text);

  limparCampos() {
    nomeController.clear;
    biController.clear;
    moradaController.clear;
    salarioController.clear;
    dateTime = null;
  }

  salvar() async {
    var trabalhador = Trabalhador(
        nome: nome,
        bi: bi,
        morada: morada,
        data: dateTime,
        salario: salario,
        urlDaFoto: _urlDaImagem);
    var _dataBase = BaseDeDadosDeTrabalhadoresImpl();
    var _dataSource = DataSourceTrabalhador(_dataBase);
    var _repositorioDeTrabalhadores = RepositorioDeTrabalhadores(_dataSource);
    var cadastro = Cadastrar.trabalhador(_repositorioDeTrabalhadores);
    var result = await cadastro.cadastrarTrabalhador(trabalhador);
    if (result is Right) {
      var confirmacao = result | false;
      if (confirmacao) {
        await showDialog(
          context: context,
          builder: (context) {
            return Mensagem(
              mensagem: 'Cadastro feito com sucesso!',
              icon: Icon(
                Icons.verified,
                size: 120,
                color: Colors.green,
              ),
            );
          },
        );
        Navigator.pop(context);
      } else {
        await showDialog(
          context: context,
          builder: (context) {
            return Mensagem(
              mensagem: 'Ocorreu um erro ao cadastrar o trabalhador',
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
  }

  cancelar() {
    Navigator.pop(context);
  }

  selecionarData() async {
    var dateResult = await showDatePicker(
      context: context,
      firstDate: DateTime(1950),
      initialDate: dateTime ?? DateTime(2005),
      lastDate: DateTime.now(),
    );
    dateTime = dateResult;
  }

  void setUrlImage(String urlDaImagem) {
    _urlDaImagem = urlDaImagem;
  }
}
