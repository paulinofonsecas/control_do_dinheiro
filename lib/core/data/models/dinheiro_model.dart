import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:control_do_dinheiro/core/modules/entitys/dinheiro.dart';

/* 
idDinheiro INTEGER PRIMARY KEY AUTOINCREMENT,
      entrada REAL,
      saida REAL,
      data DATETIME,
      idTrabalhador INTEGER,
      idDosAuxiliares TEXT
      */

class DinheiroModel extends Dinheiro {
  final int idDinheiro;
  final List<int> idDosAuxiliares;
  final int idTrabalhador;
  final double entrada;
  final double saida;
  final DateTime data;

  DinheiroModel({
    this.idDinheiro,
    this.idDosAuxiliares,
    this.idTrabalhador,
    this.entrada,
    this.saida,
    this.data,
  });

  factory DinheiroModel.fromDinheiro(Dinheiro d) {
    return DinheiroModel(
      idDinheiro: d.idDinheiro,
      idTrabalhador: d.idTrabalhador,
      idDosAuxiliares: d.idDosAuxiliares,
      entrada: d.entrada,
      saida: d.saida,
      data: d.data,
    );
  }

  Dinheiro toDinheiro() {
    return Dinheiro(
      idDinheiro: idDinheiro,
      idTrabalhador: idTrabalhador,
      idDosAuxiliares: idDosAuxiliares,
      entrada: entrada,
      saida: saida,
      data: data,
    );
  }

  DinheiroModel copyWith({
    int idDinheiro,
    List<int> idTrabalhadorAuxiliares,
    int idTrabalhadorPrincipal,
    double entrada,
    double saida,
    DateTime data,
  }) {
    return DinheiroModel(
      idDinheiro: idDinheiro ?? this.idDinheiro,
      idDosAuxiliares:
          idTrabalhadorAuxiliares ?? this.idDosAuxiliares,
      idTrabalhador:
          idTrabalhadorPrincipal ?? this.idTrabalhador,
      entrada: entrada ?? this.entrada,
      saida: saida ?? this.saida,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idDinheiro': idDinheiro,
      'idDosAuxiliares': jsonEncode(idDosAuxiliares),
      'idTrabalhador': idTrabalhador,
      'entrada': entrada,
      'saida': saida,
      'data': data?.toString(),
    };
  }

  factory DinheiroModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    if (map['entrada'] == null) return null;

    return DinheiroModel(
      idDinheiro: map['idDinheiro'],
      idDosAuxiliares:
          List<int>.from(jsonDecode(map['idDosAuxiliares'])),
      idTrabalhador: map['idTrabalhador'],
      entrada: map['entrada'],
      saida: map['saida'],
      data: DateTime.parse(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DinheiroModel.fromJson(String source) =>
      DinheiroModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DinheiroModel(idDinheiro: $idDinheiro, idTrabalhadorAuxiliares: $idDosAuxiliares, idTrabalhadorPrincipal: $idTrabalhador, entrada: $entrada, saida: $saida, data: $data)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is DinheiroModel &&
        o.idDinheiro == idDinheiro &&
        listEquals(o.idDosAuxiliares, idDosAuxiliares) &&
        o.idTrabalhador == idTrabalhador &&
        o.entrada == entrada &&
        o.saida == saida &&
        o.data == data;
  }

  @override
  int get hashCode {
    return idDinheiro.hashCode ^
        idDosAuxiliares.hashCode ^
        idTrabalhador.hashCode ^
        entrada.hashCode ^
        saida.hashCode ^
        data.hashCode;
  }
}
