import 'dart:convert';

import 'package:control_do_dinheiro/core/modules/entitys/usuario.dart';

class UsuarioModel extends Usuario {
  final int idUsuario;
  final String nome;
  final String userName;
  final String senha;
  final String urlDaFoto;
  UsuarioModel({
    this.idUsuario,
    this.nome,
    this.userName,
    this.senha,
    this.urlDaFoto,
  });


  factory UsuarioModel.fromUsuario(Usuario u) {
    return UsuarioModel(nome: u.nome, userName: u.userName, senha: u.senha);
  }


  UsuarioModel copyWith({
    int idUsuario,
    String nome,
    String userName,
    String senha,
    String urlDaFoto,
  }) {
    return UsuarioModel(
      idUsuario: idUsuario ?? this.idUsuario,
      nome: nome ?? this.nome,
      userName: userName ?? this.userName,
      senha: senha ?? this.senha,
      urlDaFoto: urlDaFoto ?? this.urlDaFoto,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idUsuario': idUsuario,
      'nome': nome,
      'userName': userName,
      'senha': senha,
      'urlDaFoto': urlDaFoto,
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UsuarioModel(
      idUsuario: map['idUsuario'],
      nome: map['nome'],
      userName: map['userName'],
      senha: map['senha'],
      urlDaFoto: map['urlDaFoto'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) => UsuarioModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UsuarioModel(idUsuario: $idUsuario, nome: $nome, userName: $userName, senha: $senha, urlDaFoto: $urlDaFoto)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is UsuarioModel &&
      o.idUsuario == idUsuario &&
      o.nome == nome &&
      o.userName == userName &&
      o.senha == senha &&
      o.urlDaFoto == urlDaFoto;
  }

  @override
  int get hashCode {
    return idUsuario.hashCode ^
      nome.hashCode ^
      userName.hashCode ^
      senha.hashCode ^
      urlDaFoto.hashCode;
  }
}
