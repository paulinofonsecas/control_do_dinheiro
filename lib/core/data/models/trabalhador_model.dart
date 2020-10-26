import 'dart:convert';

import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';

class TrabalhadorModel extends Trabalhador {
  final int idTrabalhador;
  final String userName;
  final String nome;
  final DateTime dataDeAniversario;
  final String senha;
  final String urlDaFoto;
  final double salario;
  
  TrabalhadorModel({
    this.idTrabalhador,
    this.userName,
    this.nome,
    this.dataDeAniversario,
    this.senha,
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
      userName: bi ?? this.userName,
      nome: nome ?? this.nome,
      dataDeAniversario: dataDeAniversario ?? this.dataDeAniversario,
      senha: morada ?? this.senha,
      urlDaFoto: urlDaFoto ?? this.urlDaFoto,
      salario: salario ?? this.salario,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idTrabalhador': idTrabalhador,
      'bi': userName,
      'nome': nome,
      'dataDeAniversario': dataDeAniversario?.millisecondsSinceEpoch,
      'morada': senha,
      'urlDaFoto': urlDaFoto,
      'salario': salario,
    };
  }

  factory TrabalhadorModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TrabalhadorModel(
      idTrabalhador: map['idTrabalhador'],
      userName: map['bi'],
      nome: map['nome'],
      dataDeAniversario:
          DateTime.fromMillisecondsSinceEpoch(map['dataDeAniversario']),
      senha: map['morada'],
      urlDaFoto: map['urlDaFoto'],
      salario: map['salario'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TrabalhadorModel.fromJson(String source) =>
      TrabalhadorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TrabalhadorModel(idTrabalhador: $idTrabalhador, bi: $userName, nome: $nome, dataDeAniversario: $dataDeAniversario, morada: $senha, urlDaFoto: $urlDaFoto, salario: $salario)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TrabalhadorModel &&
        o.idTrabalhador == idTrabalhador &&
        o.userName == userName &&
        o.nome == nome &&
        o.dataDeAniversario == dataDeAniversario &&
        o.senha == senha &&
        o.urlDaFoto == urlDaFoto &&
        o.salario == salario;
  }

  @override
  int get hashCode {
    return idTrabalhador.hashCode ^
        userName.hashCode ^
        nome.hashCode ^
        dataDeAniversario.hashCode ^
        senha.hashCode ^
        urlDaFoto.hashCode ^
        salario.hashCode;
  }
}
