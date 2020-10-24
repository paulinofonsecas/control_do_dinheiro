import 'dart:convert';

import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';

class TrabalhadorModel extends Trabalhador {
  final int idTrabalhador;
  final String bi;
  final String nome;
  final DateTime dataDeAniversario;
  final String morada;
  final String urlDaFoto;
  final double salario;
  
  TrabalhadorModel({
    this.idTrabalhador,
    this.bi,
    this.nome,
    this.dataDeAniversario,
    this.morada,
    this.urlDaFoto,
    this.salario,
  });

  TrabalhadorModel copyWith({
    int idTrabalhador,
    String bi,
    String nome,
    DateTime dataDeAniversario,
    String morada,
    String urlDaFoto,
    double salario,
  }) {
    return TrabalhadorModel(
      idTrabalhador: idTrabalhador ?? this.idTrabalhador,
      bi: bi ?? this.bi,
      nome: nome ?? this.nome,
      dataDeAniversario: dataDeAniversario ?? this.dataDeAniversario,
      morada: morada ?? this.morada,
      urlDaFoto: urlDaFoto ?? this.urlDaFoto,
      salario: salario ?? this.salario,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idTrabalhador': idTrabalhador,
      'bi': bi,
      'nome': nome,
      'dataDeAniversario': dataDeAniversario?.millisecondsSinceEpoch,
      'morada': morada,
      'urlDaFoto': urlDaFoto,
      'salario': salario,
    };
  }

  factory TrabalhadorModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TrabalhadorModel(
      idTrabalhador: map['idTrabalhador'],
      bi: map['bi'],
      nome: map['nome'],
      dataDeAniversario:
          DateTime.fromMillisecondsSinceEpoch(map['dataDeAniversario']),
      morada: map['morada'],
      urlDaFoto: map['urlDaFoto'],
      salario: map['salario'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TrabalhadorModel.fromJson(String source) =>
      TrabalhadorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TrabalhadorModel(idTrabalhador: $idTrabalhador, bi: $bi, nome: $nome, dataDeAniversario: $dataDeAniversario, morada: $morada, urlDaFoto: $urlDaFoto, salario: $salario)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TrabalhadorModel &&
        o.idTrabalhador == idTrabalhador &&
        o.bi == bi &&
        o.nome == nome &&
        o.dataDeAniversario == dataDeAniversario &&
        o.morada == morada &&
        o.urlDaFoto == urlDaFoto &&
        o.salario == salario;
  }

  @override
  int get hashCode {
    return idTrabalhador.hashCode ^
        bi.hashCode ^
        nome.hashCode ^
        dataDeAniversario.hashCode ^
        morada.hashCode ^
        urlDaFoto.hashCode ^
        salario.hashCode;
  }
}
