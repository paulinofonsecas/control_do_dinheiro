import 'dart:convert';

import 'package:control_do_dinheiro/core/modules/entitys/usuario.dart';

class UsuarioModel extends Usuario {
  final int idUsuario;
  final String bi;
  final String nome;
  final DateTime dataDeAniversario;
  final String morada;
  final String urlDaFoto;

  UsuarioModel({
    this.idUsuario,
    this.bi,
    this.nome,
    this.dataDeAniversario,
    this.morada,
    this.urlDaFoto,
  });

  UsuarioModel copyWith({
    int idUsuario,
    String bi,
    String nome,
    DateTime dataDeAniversario,
    String morada,
    String urlDaFoto,
  }) {
    return UsuarioModel(
      idUsuario: idUsuario ?? this.idUsuario,
      bi: bi ?? this.bi,
      nome: nome ?? this.nome,
      dataDeAniversario: dataDeAniversario ?? this.dataDeAniversario,
      morada: morada ?? this.morada,
      urlDaFoto: urlDaFoto ?? this.urlDaFoto,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idUsuario': idUsuario,
      'bi': bi,
      'nome': nome,
      'dataDeAniversario': dataDeAniversario?.millisecondsSinceEpoch,
      'morada': morada,
      'urlDaFoto': urlDaFoto,
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UsuarioModel(
      idUsuario: map['idUsuario'],
      bi: map['bi'],
      nome: map['nome'],
      dataDeAniversario:
          DateTime.fromMillisecondsSinceEpoch(map['dataDeAniversario']),
      morada: map['morada'],
      urlDaFoto: map['urlDaFoto'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) =>
      UsuarioModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UsuarioModel(idUsuario: $idUsuario, bi: $bi, nome: $nome, dataDeAniversario: $dataDeAniversario, morada: $morada, urlDaFoto: $urlDaFoto)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UsuarioModel &&
        o.idUsuario == idUsuario &&
        o.bi == bi &&
        o.nome == nome &&
        o.dataDeAniversario == dataDeAniversario &&
        o.morada == morada &&
        o.urlDaFoto == urlDaFoto;
  }

  @override
  int get hashCode {
    return idUsuario.hashCode ^
        bi.hashCode ^
        nome.hashCode ^
        dataDeAniversario.hashCode ^
        morada.hashCode ^
        urlDaFoto.hashCode;
  }
}
