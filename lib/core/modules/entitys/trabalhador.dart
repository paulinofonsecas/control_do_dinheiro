import 'package:control_do_dinheiro/core/modules/entitys/pessoa.dart';

class Trabalhador extends Pessoa {
  final String bi;
  final String nome;
  final DateTime dataDeAniversario;
  final String morada;
  final String urlDaFoto;
  final double salario;

  Trabalhador({
    this.bi,
    this.nome,
    this.dataDeAniversario,
    this.morada,
    this.urlDaFoto,
    this.salario,
  }) : super(
          bi,
          nome,
          dataDeAniversario,
          morada,
          urlDaFoto,
        );
}
