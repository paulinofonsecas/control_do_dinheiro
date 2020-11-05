import 'package:control_do_dinheiro/core/modules/entitys/pessoa.dart';

class Trabalhador extends Pessoa {
  final int idTrabalhador;
  final String bi;
  final String nome;
  final DateTime data;
  final String morada;
  final String urlDaFoto;
  final double salario;

  Trabalhador({
    this.idTrabalhador,
    this.bi,
    this.nome,
    this.data,
    this.morada,
    this.urlDaFoto,
    this.salario,
  }) : super(
          bi,
          nome,
          data,
          morada,
          urlDaFoto,
        );

  @override
  String toString() {
    return 'Trabalhador(idTrabalhador: $idTrabalhador, bi: $bi, nome: $nome, data: $data, morada: $morada, urlDaFoto: $urlDaFoto, salario: $salario)';
  }
}
