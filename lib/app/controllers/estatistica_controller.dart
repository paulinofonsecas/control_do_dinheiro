import 'package:control_do_dinheiro/app/pages/home_page/componentes/registro_item.dart';
import 'package:control_do_dinheiro/core/modules/usecases/get_registros.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class EstatisticaController {
  final BuildContext context;
  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffff5182);
  final double width = 14;

  EstatisticaController(this.context);

  var entradaNaSemana = {
    1: 0.0,
    2: 0.0,
    3: 0.0,
    4: 0.0,
    5: 0.0,
    6: 0.0,
    7: 0.0,
  };
  var saidaNaSemana = {
    1: 0.0,
    2: 0.0,
    3: 0.0,
    4: 0.0,
    5: 0.0,
    6: 0.0,
    7: 0.0,
  };

  TextStyle getTitleStyle(double value) {
    return TextStyle(
      color: Colors.white,
      fontSize: 18,
    );
  }

  String getTitles(double value) {
    switch (value.toInt()) {
      case 1:
        return 'Se';
      case 2:
        return 'Te';
      case 3:
        return 'Qa';
      case 4:
        return 'Qu';
      case 5:
        return 'Se';
      case 6:
        return 'Sa';
      case 7:
        return 'Do';
      default:
        return '';
    }
  }

  Future<List<Registro>> get getRegistros async {
    return registros();
  }

  criarOsDados() async {
    // var registros = [
    //   Registro(dateTime: DateTime(2020, 11, 9), entrada: 10000, saida: 5000),
    //   Registro(dateTime: DateTime(2020, 11, 10), entrada: 20000, saida: 18500),
    //   Registro(dateTime: DateTime(2020, 11, 11), entrada: 15000, saida: 9000),
    //   Registro(dateTime: DateTime(2020, 11, 12), entrada: 8000, saida: 4000),
    //   Registro(dateTime: DateTime(2020, 11, 13), entrada: 12000, saida: 9000),
    //   Registro(dateTime: DateTime(2020, 11, 14), entrada: 7000, saida: 5600),
    //   Registro(dateTime: DateTime(2020, 11, 15), entrada: 18000, saida: 15000),
    // ];
    var registros = await getRegistros;
    registros.forEach((r) {
      var semana = r.dateTime.weekday;
      entradaNaSemana[semana] = r.entrada;
      saidaNaSemana[semana] = r.saida;
    });
  }

  List<BarChartGroupData> get getBarGroupsOfWeek {
    criarOsDados();
    return List.generate(
      7,
      (index) {
        return BarChartGroupData(
          x: index + 1,
          barRods: [
            BarChartRodData(
              y: entradaNaSemana.values.toList()[index],
              colors: [leftBarColor],
              width: width,
            ),
            BarChartRodData(
              y: saidaNaSemana.values.toList()[index],
              colors: [rightBarColor],
              width: width,
            ),
          ],
        );
      },
    );
  }
}
