import 'package:control_do_dinheiro/app/cubits/cadastro_de_trabalhadores/cadastro_de_trabalhadores_cubit.dart';
import 'package:control_do_dinheiro/app/pages/cadastro_de_trabalhador/cadastro_de_trabalhador_page.dart';
import 'package:control_do_dinheiro/app/pages/home_page/componentes/mostrar_dinheiro.dart';
import 'package:control_do_dinheiro/app/pages/home_page/telas/resgistros_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'trabalhadores/componentes/trabalhador_item_widget.dart';

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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (context) => CadastroDeTrabalhadoresCubit(context),
                  child: CadastroDeTrabalhador(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

