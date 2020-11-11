import 'package:control_do_dinheiro/app/pages/home_page/componentes/registro_item.dart';
import 'package:control_do_dinheiro/app/pages/registrar_venda/registrar_venda_page.dart';
import 'package:control_do_dinheiro/core/modules/usecases/get_registros.dart';

import 'package:flutter/material.dart';

class RegistrosScreenController {
  BuildContext context;

  RegistrosScreenController(this.context);

  Future<List<Registro>> getRegistros() async {
    var registroList = registros();
    return registroList;
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
