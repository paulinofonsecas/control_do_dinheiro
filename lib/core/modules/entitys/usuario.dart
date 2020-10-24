import 'package:control_do_dinheiro/core/modules/entitys/pessoa.dart';

class Usuario extends Pessoa {
  final String bi;
  final String nome;
  final DateTime dataDeAniversario;
  final String morada;
  final String urlDaFoto;

  Usuario({
    this.bi,
    this.nome,
    this.dataDeAniversario,
    this.morada,
    this.urlDaFoto,
  }) : super(bi, nome, dataDeAniversario, morada, urlDaFoto);
}
