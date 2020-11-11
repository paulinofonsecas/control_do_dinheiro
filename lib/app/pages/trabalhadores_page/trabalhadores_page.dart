import 'package:control_do_dinheiro/app/componenets/custom_appbar.dart';
import 'package:control_do_dinheiro/app/controllers/trabalhador_item_controller.dart';
import 'package:control_do_dinheiro/app/cubits/cadastro_de_trabalhadores/cadastro_de_trabalhadores_cubit.dart';
import 'package:control_do_dinheiro/app/pages/cadastro_de_trabalhador/cadastro_de_trabalhador_page.dart';
import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/trabalhador_item_widget.dart';

class TrabalhadoresPage extends StatefulWidget {
  const TrabalhadoresPage({
    Key key,
  }) : super(key: key);

  @override
  _TrabalhadoresPageState createState() => _TrabalhadoresPageState();
}

class _TrabalhadoresPageState extends State<TrabalhadoresPage>
    with SingleTickerProviderStateMixin {
  PageController _pageViewController;
  TrabalhadorController _controller;

  @override
  void initState() {
    _controller = TrabalhadorController(context);
    _pageViewController = PageController(
      viewportFraction: .7,
      initialPage: 1,
      keepPage: false,
    );
    super.initState();
  }

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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder<List<Trabalhador>>(
                      future: _controller.trabalhadores,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          var trabalhadorList = snapshot.data;
                          if (trabalhadorList.isEmpty)
                            return semDadosAMostrar();
                          else
                            return buildListView(trabalhadorList);
                        } else
                          return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff41d1e2),
          child: Icon(
            Icons.add,
            color: Color(0xff282936),
          ),
          onPressed: _controller.irParaAtelaDeCadastroDeTrabalhadores,
        ),
      ),
    );
  }

  Widget buildListView(List<Trabalhador> trabalhadorList) {
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

  Widget semDadosAMostrar() {
    return Container(
      child: Center(
        child: Text(
          'Sem trabalhadores cadastrados',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
