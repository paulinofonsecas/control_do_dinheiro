import 'package:control_do_dinheiro/app/pages/estatistica/estatistica_page.dart';
import 'package:control_do_dinheiro/app/pages/registros_pages/resgistros_screen.dart';
import 'package:control_do_dinheiro/app/pages/trabalhadores_page/trabalhadores_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageViewController;

  @override
  void initState() {
    _pageViewController = PageController(initialPage: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageViewController,
        scrollDirection: Axis.horizontal,
        children: [
          TrabalhadoresPage(),
          EstatisticaPage(),
          RegistroPage(),
        ],
      ),
    );
  }
}
