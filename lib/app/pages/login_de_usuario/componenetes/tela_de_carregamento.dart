import 'package:flutter/material.dart';

import 'logo.dart';

class TelaDeCarregamento extends StatefulWidget {
  const TelaDeCarregamento({
    Key key,
  }) : super(key: key);

  @override
  _TelaDeCarregamentoState createState() => _TelaDeCarregamentoState();
}

class _TelaDeCarregamentoState extends State<TelaDeCarregamento>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff282936),
      body: Container(
        child: Column(
          children: [
            Logo(
              title: 'Entrando...',
              style: TextStyle(
                color: Colors.white,
                fontSize: size.height * .05,
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, animation) {
                return ScaleTransition(
                  alignment: Alignment.center,
                  scale: _controller.drive(
                    Tween(begin: 3, end: 1),
                  ),
                  child: Hero(
                    tag: 'progress',
                    child: Container(
                      width: 60,
                      height: 60,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(90),
                      ),
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
