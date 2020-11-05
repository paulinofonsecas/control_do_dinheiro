import 'package:control_do_dinheiro/app/controllers/trabalhador_item_controlle.dart';
import 'package:control_do_dinheiro/app/cubits/cadastro_de_trabalhadores/cadastro_de_trabalhadores_cubit.dart';
import 'package:control_do_dinheiro/app/pages/cadastro_de_trabalhador/cadastro_de_trabalhador_page.dart';
import 'package:control_do_dinheiro/app/pages/home_page/componentes/mostrar_dinheiro.dart';
import 'package:control_do_dinheiro/app/pages/home_page/telas/resgistros_screen.dart';
import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'componentes/trabalhador_item_widget.dart';

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
  TrabalhadorController _controller;

  @override
  void initState() {
    _controller = TrabalhadorController();
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
              FutureBuilder<List<Trabalhador>>(
                  future: _controller.trabalhadores,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return buildListView(snapshot);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
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
                  create: (con) => CadastroDeTrabalhadoresCubit(con),
                  child: CadastroDeTrabalhador(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildListView(AsyncSnapshot<List<Trabalhador>> snapshot) {
    var trabalhadorList = snapshot.data;
    if (trabalhadorList.isEmpty)
      return Center(
        child: Text(
          'Sem trabalhadores cadastrados',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    return Container(
      width: double.infinity,
      height: 500,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28.0),
        child: PageView.builder(
          controller: _pageViewController,
          scrollDirection: Axis.horizontal,
          itemCount: trabalhadorList.length,
          itemBuilder: (_, index) {
            var trabalhador = trabalhadorList[index];
            return TrabalhadorItem(
              trabalhador: trabalhador,
            );
          },
        ),
      ),
    );
  }
}
