import 'dart:io';
import 'package:control_do_dinheiro/app/controllers/trabalhador_view_controller.dart';
import 'package:control_do_dinheiro/app/pages/home_page/componentes/registro_item.dart';
import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:flutter/material.dart';

class TrabalhadorViewPage extends StatefulWidget {
  final Trabalhador trabalhador;
  TrabalhadorViewPage({this.trabalhador});

  @override
  _TrabalhadorViewPageState createState() => _TrabalhadorViewPageState();
}

class _TrabalhadorViewPageState extends State<TrabalhadorViewPage> {
  TrabalhadorViewController controller;

  @override
  void initState() {
    controller = TrabalhadorViewController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: controller.sair,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    child: Icon(
                      Icons.info,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Registro>>(
              future: controller.registros,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var registros = snapshot.data;
                  return Expanded(
                    child: ListView(children: [
                      userInfo(size),
                      ...registros
                          .map((reg) => RegistroItem(registro: reg))
                          .toList(),
                    ]),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget userInfo(Size size) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Align(
        child: Column(
          children: [
            Container(
              width: size.width * .4,
              height: size.width * .4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(
                    File(widget.trabalhador.urlDaFoto),
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(size.width * .4),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.trabalhador.nome,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
