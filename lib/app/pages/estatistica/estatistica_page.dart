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
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: BarChart(
                BarChartData(
                  groupsSpace: 20,
                  titlesData: FlTitlesData(
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: _controller.getTitleStyle,
                      getTitles: _controller.getTitles,
                    ),
                  ),
                  barGroups: _controller.getBarGroupsOfWeek,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
