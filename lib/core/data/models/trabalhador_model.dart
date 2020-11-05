import 'dart:convert';

import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';

class TrabalhadorModel extends Trabalhador {
  final int idTrabalhador;
  final String bi;
  final String nome;
  final DateTime data;
  final String morada;
  final String urlDaFoto;
  final double salario;

  TrabalhadorModel({
    this.idTrabalhador,
    this.bi,
    this.nome,
    this.data,
    this.morada,
    this.urlDaFoto,
    this.salario,
  });

  factory TrabalhadorModel.fromTrabalhador(Trabalhador trabalhador) {
    return TrabalhadorModel(
      idTrabalhador: trabalhador.idTrabalhador,
      nome: trabalhador.nome,
      data: trabalhador.data,
      morada: trabalhador.morada,
      urlDaFoto: trabalhador.urlDaFoto,
      salario: trabalhador.salario,
    );
  }

  TrabalhadorModel copyWith({
    int idTrabalhador,
    String bi,
    String nome,
    DateTime data,
    String morada,
    String urlDaFoto,
    double salario,
  }) {
    return TrabalhadorModel(
      idTrabalhador: idTrabalhador ?? this.idTrabalhador,
      bi: bi ?? this.bi,
      nome: nome ?? this.nome,
      data: data ?? this.data,
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
      'data': data.toString(),
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
      data: DateTime.parse(map['data']),
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
    return 'TrabalhadorModel(idTrabalhador: $idTrabalhador, bi: $bi, nome: $nome, data: $data, morada: $morada, urlDaFoto: $urlDaFoto, salario: $salario)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TrabalhadorModel &&
        o.idTrabalhador == idTrabalhador &&
        o.bi == bi &&
        o.nome == nome &&
        o.data == data &&
        o.morada == morada &&
        o.urlDaFoto == urlDaFoto &&
        o.salario == salario;
  }

  @override
  int get hashCode {
    return idTrabalhador.hashCode ^
        bi.hashCode ^
        nome.hashCode ^
        data.hashCode ^
        morada.hashCode ^
        urlDaFoto.hashCode ^
        salario.hashCode;
  }
}
