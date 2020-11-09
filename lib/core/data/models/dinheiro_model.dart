import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:control_do_dinheiro/core/modules/entitys/dinheiro.dart';

class DinheiroModel extends Dinheiro {
  final int idDinheiro;
  final List<int> idTrabalhadorAuxiliares;
  final int idTrabalhadorPrincipal;
  final double entrada;
  final double saida;
  final DateTime data;

  DinheiroModel({
    this.idDinheiro,
    this.idTrabalhadorAuxiliares,
    this.idTrabalhadorPrincipal,
    this.entrada,
    this.saida,
    this.data,
  });

  factory DinheiroModel.fromDinheiro(Dinheiro d) {
    return DinheiroModel();
  }

  Dinheiro toDinheiro() {
    return Dinheiro(
      idDinheiro: idDinheiro,
      idTrabalhadorPrincipal: idTrabalhadorPrincipal,
      idTrabalhadorAuxiliares: idTrabalhadorAuxiliares,
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
      idTrabalhadorAuxiliares:
          idTrabalhadorAuxiliares ?? this.idTrabalhadorAuxiliares,
      idTrabalhadorPrincipal:
          idTrabalhadorPrincipal ?? this.idTrabalhadorPrincipal,
      entrada: entrada ?? this.entrada,
      saida: saida ?? this.saida,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idDinheiro': idDinheiro,
      'idTrabalhadorAuxiliares': idTrabalhadorAuxiliares,
      'idTrabalhadorPrincipal': idTrabalhadorPrincipal,
      'entrada': entrada,
      'saida': saida,
      'data': data?.millisecondsSinceEpoch,
    };
  }

  factory DinheiroModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return DinheiroModel(
      idDinheiro: map['idDinheiro'],
      idTrabalhadorAuxiliares: List<int>.from(map['idTrabalhadorAuxiliares']),
      idTrabalhadorPrincipal: map['idTrabalhadorPrincipal'],
      entrada: map['entrada'],
      saida: map['saida'],
      data: DateTime.fromMillisecondsSinceEpoch(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DinheiroModel.fromJson(String source) =>
      DinheiroModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DinheiroModel(idDinheiro: $idDinheiro, idTrabalhadorAuxiliares: $idTrabalhadorAuxiliares, idTrabalhadorPrincipal: $idTrabalhadorPrincipal, entrada: $entrada, saida: $saida, data: $data)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is DinheiroModel &&
        o.idDinheiro == idDinheiro &&
        listEquals(o.idTrabalhadorAuxiliares, idTrabalhadorAuxiliares) &&
        o.idTrabalhadorPrincipal == idTrabalhadorPrincipal &&
        o.entrada == entrada &&
        o.saida == saida &&
        o.data == data;
  }

  @override
  int get hashCode {
    return idDinheiro.hashCode ^
        idTrabalhadorAuxiliares.hashCode ^
        idTrabalhadorPrincipal.hashCode ^
        entrada.hashCode ^
        saida.hashCode ^
        data.hashCode;
  }
}
