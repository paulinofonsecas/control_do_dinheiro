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
    @required this.trabalhadoresSelecionados,
    @required this.onTap,
  }) : super(key: key);

  final Function onTap;
  final List<Trabalhador> trabalhadores;
  final List<Trabalhador> trabalhadoresSelecionados;

  @override
  _TrabalhadoresAuxiliaresState createState() =>
      _TrabalhadoresAuxiliaresState();
}

class _TrabalhadoresAuxiliaresState extends State<TrabalhadoresAuxiliares> {
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
              if (widget.trabalhadoresSelecionados.isNotEmpty)
                ...widget.trabalhadoresSelecionados.map((t) {
                  return MiniPhotoProfile(
                    imageProvider: (t.urlDaFoto == null || t.urlDaFoto == '')
                        ? AssetImage('assets/profile.JPG')
                        : FileImage(
                            File(t.urlDaFoto),
                          ),
                  );
                }).toList(),
              CustomBtnAdd(
                onTap: widget.onTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
