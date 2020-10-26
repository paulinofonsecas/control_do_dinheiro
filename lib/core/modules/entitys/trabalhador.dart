import 'package:control_do_dinheiro/core/modules/entitys/pessoa.dart';

class Trabalhador extends Pessoa {
  final int idTrabalhador;
  final String userName;
  final String nome;
  final DateTime dataDeAniversario;
  final String senha;
  final String urlDaFoto;
  final double salario;

  Trabalhador({
    this.idTrabalhador,
    this.userName,
    this.nome,
    this.dataDeAniversario,
    this.senha,
    this.urlDaFoto,
    this.salario,
  }) : super(
          userName,
          nome,
          dataDeAniversario,
          senha,
          urlDaFoto,
        );
}
