import 'dart:convert';

import 'package:control_do_dinheiro/core/modules/entitys/usuario.dart';

class UsuarioModel extends Usuario {
  final int idUsuario;
  final String userName;
  final String nome;
  final DateTime dataDeAniversario;
  final String senha;
  final String urlDaFoto;

  UsuarioModel({
    this.idUsuario,
    this.userName,
    this.nome,
    this.dataDeAniversario,
    this.senha,
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
      userName: bi ?? this.userName,
      nome: nome ?? this.nome,
      dataDeAniversario: dataDeAniversario ?? this.dataDeAniversario,
      senha: morada ?? this.senha,
      urlDaFoto: urlDaFoto ?? this.urlDaFoto,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idUsuario': idUsuario,
      'bi': userName,
      'nome': nome,
      'dataDeAniversario': dataDeAniversario?.millisecondsSinceEpoch,
      'morada': senha,
      'urlDaFoto': urlDaFoto,
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UsuarioModel(
      idUsuario: map['idUsuario'],
      userName: map['bi'],
      nome: map['nome'],
      dataDeAniversario:
          DateTime.fromMillisecondsSinceEpoch(map['dataDeAniversario']),
      senha: map['morada'],
      urlDaFoto: map['urlDaFoto'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) =>
      UsuarioModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UsuarioModel(idUsuario: $idUsuario, bi: $userName, nome: $nome, dataDeAniversario: $dataDeAniversario, morada: $senha, urlDaFoto: $urlDaFoto)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UsuarioModel &&
        o.idUsuario == idUsuario &&
        o.userName == userName &&
        o.nome == nome &&
        o.dataDeAniversario == dataDeAniversario &&
        o.senha == senha &&
        o.urlDaFoto == urlDaFoto;
  }

  @override
  int get hashCode {
    return idUsuario.hashCode ^
        userName.hashCode ^
        nome.hashCode ^
        dataDeAniversario.hashCode ^
        senha.hashCode ^
        urlDaFoto.hashCode;
  }
}
