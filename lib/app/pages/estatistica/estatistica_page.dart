import 'package:control_do_dinheiro/app/controllers/estatistica_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class EstatisticaPage extends StatefulWidget {
  @override
  _EstatisticaPageState createState() => _EstatisticaPageState();
}

class _EstatisticaPageState extends State<EstatisticaPage> {
  EstatisticaController _controller;

  @override
  void initState() {
    _controller = EstatisticaController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Estatistica da Semana',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 50),
              CustomChart(controller: _controller),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomChart extends StatelessWidget {
  const CustomChart({
    Key key,
    @required EstatisticaController controller,
  })  : _controller = controller,
        super(key: key);

  final EstatisticaController _controller;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.center,
        groupsSpace: 20,
        borderData: FlBorderData(
          show: false,
        ),
        titlesData: FlTitlesData(
          leftTitles: SideTitles(
            showTitles: false,
          ),
          bottomTitles: SideTitles(
            showTitles: true,
            getTextStyles: _controller.getTitleStyle,
            getTitles: _controller.getTitles,
          ),
        ),
        barGroups: _controller.getBarGroupsOfWeek,
      ),
    );
  }
}
