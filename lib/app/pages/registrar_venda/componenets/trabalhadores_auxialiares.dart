import 'dart:io';

import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:flutter/material.dart';

import 'custom_btn_add.dart';
import 'escolher_trabalhador.dart';
import 'mini_photo_profile.dart';

class TrabalhadoresAuxiliares extends StatefulWidget {
  const TrabalhadoresAuxiliares({
    Key key,
    @required this.trabalhadores,
  }) : super(key: key);

  final List<Trabalhador> trabalhadores;

  @override
  _TrabalhadoresAuxiliaresState createState() =>
      _TrabalhadoresAuxiliaresState();
}

class _TrabalhadoresAuxiliaresState extends State<TrabalhadoresAuxiliares> {
  List<Trabalhador> trabalhadoresSelecionados = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trabalhadores Auxiliares',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(height: 15),
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            spacing: 5,
            children: [
              if (trabalhadoresSelecionados.isNotEmpty)
                ...trabalhadoresSelecionados.map((t) {
                  return MiniPhotoProfile(
                  imageProvider: (t.urlDaFoto == null ||
                            t.urlDaFoto == '')
                        ? AssetImage('assets/profile.JPG')
                        : FileImage(
                            File(t.urlDaFoto),
                          ),
                  );
                }).toList(),
              CustomBtnAdd(
                onTap: () async {
                  List<Trabalhador> trabalhadoresRetornados =
                      await Navigator.push(
                    context,
                    PageRouteBuilder(
                      barrierDismissible: false,
                      opaque: false,
                      barrierColor: Colors.black.withOpacity(.4),
                      pageBuilder: (context, anim1, anim2) {
                        return EscolherTrabalhador(
                          trabalhadores: widget.trabalhadores,
                          trabalhadoresSelecionados: trabalhadoresSelecionados,
                        );
                      },
                    ),
                  );
                  if (trabalhadoresRetornados != null)
                    setState(() {
                      trabalhadoresSelecionados = trabalhadoresRetornados;
                    });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
