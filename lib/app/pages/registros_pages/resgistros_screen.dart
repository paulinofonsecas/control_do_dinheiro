import 'package:control_do_dinheiro/app/componenets/custom_appbar.dart';
import 'package:control_do_dinheiro/app/controllers/registros_screen_controller.dart';
import 'package:control_do_dinheiro/app/pages/home_page/componentes/registro_item.dart';
import 'package:flutter/material.dart';

class RegistroPage extends StatefulWidget {
  RegistroPage({
    Key key,
  }) : super(key: key);

  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  RegistrosScreenController _controller;

  @override
  void initState() {
    _controller = RegistrosScreenController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff282936),
        body: FutureBuilder<List<Registro>>(
          future: _controller.registros,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var registros = snapshot.data;
              return Column(
                children: [
                  _buildCustomAppBar(registros: registros),
                  SizedBox(height: 25),
                  buildList(registroList: registros),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color(0xFF3CABD6),
          icon: Icon(Icons.add, color: Color(0xff282936)),
          label: Text(
            'Rigistrar venda',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          onPressed: _controller.registrarVenda,
        ),
      ),
    );
  }

  Expanded buildList({List<Registro> registroList}) {
    var registros = registroList;
    return Expanded(
      child: Container(
        child: registros.isEmpty
            ? Center(
                child: Text(
                  'Sem registros',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: registros.length,
                itemBuilder: (_, index) =>
                    RegistroItem(registro: registros[index]),
              ),
      ),
    );
  }

  Widget _buildCustomAppBar({List<Registro> registros}) {
    var isEmpty = registros.isEmpty;
    return CustomAppBar(
      isEmpty: isEmpty,
      title: 'Registros',
      actions: [
        IconButton(
          onPressed: isEmpty ? () {} : null,
          icon: Icon(
            Icons.switch_camera_rounded,
            color: isEmpty ? Colors.white : Colors.grey,
            size: 40,
          ),
        ),
        IconButton(
          onPressed: isEmpty ? () {} : null,
          icon: Icon(
            Icons.bar_chart,
            color: isEmpty ? Colors.white : Colors.grey,
            size: 40,
          ),
        ),
      ],
    );
  }
}