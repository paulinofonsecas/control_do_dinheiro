import 'package:control_do_dinheiro/app/pages/home_page/telas/resgistros_screen.dart';
import 'package:control_do_dinheiro/app/pages/home_page/telas/trabalhadores/trabalhadores_screen.dart';
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
    return PageView(
      controller: _pageViewController,
      scrollDirection: Axis.horizontal,
      children: [
        TrabalhadoresScreen(),
        RegistroScreen(),
        Container(color: Colors.red),
      ],
    );
  }
}
