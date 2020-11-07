import 'package:control_do_dinheiro/app/pages/home_page/componentes/registro_item.dart';
import 'package:control_do_dinheiro/app/pages/registrar_venda/registrar_venda_page.dart';
import 'package:flutter/material.dart';

class RegistrosScreenController {
  BuildContext context;

  RegistrosScreenController(this.context);

  final _registros = [
    Registro(
        nomeDoFuncionario: 'Cailoy',
        entrada: 18000,
        saida: 1500,
        dateTime: DateTime.now()),
    Registro(
        nomeDoFuncionario: 'Mario',
        entrada: 16500,
        saida: 2500,
        dateTime: DateTime.now()),
    Registro(
        nomeDoFuncionario: 'Zeca',
        entrada: 17150,
        saida: 3000,
        dateTime: DateTime.now()),
    Registro(
        nomeDoFuncionario: 'Kapapelo',
        entrada: 22300,
        saida: 500,
        dateTime: DateTime.now()),
    Registro(
        nomeDoFuncionario: 'Cailoy',
        entrada: 24850,
        saida: 1000,
        dateTime: DateTime.now()),
    Registro(
        nomeDoFuncionario: 'Cailoy',
        entrada: 10220,
        saida: 2200,
        dateTime: DateTime.now()),
    Registro(
        nomeDoFuncionario: 'Cailoy',
        entrada: 7000,
        saida: 200,
        dateTime: DateTime.now()),
    Registro(
        nomeDoFuncionario: 'Mario',
        entrada: 8350,
        saida: 500,
        dateTime: DateTime.now()),
    Registro(
        nomeDoFuncionario: 'Zeca',
        entrada: 14200,
        saida: 6000,
        dateTime: DateTime.now()),
    Registro(
        nomeDoFuncionario: 'Kapapelo',
        entrada: 5300,
        saida: 8000,
        dateTime: DateTime.now()),
  ];

  Future<List<Registro>> get registros async {
    return _registros;
  }

  void registrarVenda() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegistrarVenda(),
      ),
    );
  }
}
