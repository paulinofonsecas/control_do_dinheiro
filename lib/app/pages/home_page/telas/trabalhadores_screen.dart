import 'package:control_do_dinheiro/app/pages/home_page/componentes/mostrar_dinheiro.dart';
import 'package:control_do_dinheiro/app/pages/home_page/telas/resgistros_screen.dart';
import 'package:flutter/material.dart';

class TrabalhadoresScreen extends StatefulWidget {
  const TrabalhadoresScreen({
    Key key,
  }) : super(key: key);

  @override
  _TrabalhadoresScreenState createState() => _TrabalhadoresScreenState();
}

class _TrabalhadoresScreenState extends State<TrabalhadoresScreen>
    with SingleTickerProviderStateMixin {
  PageController _pageViewController;

  @override
  void initState() {
    _pageViewController = PageController(
      viewportFraction: .7,
      initialPage: 1,
      keepPage: false,
    );
    super.initState();
  }

  var scale = 1.0;
  var gndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              CustomAppBar(
                title: 'Trabalhadores',
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.stacked_line_chart,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 28.0),
                  child: PageView.builder(
                    controller: _pageViewController,
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (_, index) => TrabalhadorItem(),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff41d1e2),
          child: Icon(
            Icons.add,
            color: Color(0xff282936),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}

class TrabalhadorItem extends StatelessWidget {
  const TrabalhadorItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * .60,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.06),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              image: DecorationImage(
                image: AssetImage('assets/profile.JPG'),
              ),
            ),
            width: 150,
            height: 150,
          ),
          SizedBox(height: 10),
          Text(
            'Paulino Ciaia',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 25),
          Column(
            children: [
              MostrarDinheiro(titlo: 'Entrada', valor: 40000),
              SizedBox(height: 18),
              MostrarDinheiro(
                titlo: 'Saida',
                valor: 10000,
                color: Colors.red,
              ),
            ],
          )
        ],
      ),
    );
  }
}
