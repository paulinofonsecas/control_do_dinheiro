import 'dart:io';

import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:flutter/material.dart';

import 'custom_btn_add.dart';
import 'mini_photo_profile.dart';

class TrabalhadorPrincipal extends StatefulWidget {
  TrabalhadorPrincipal({
    Key key,
    @required this.trabalhadores,
    @required this.trabalhadorPrincipal,
    @required this.onTap,
  }) : super(key: key);

  final Function onTap;
  final List<Trabalhador> trabalhadores;
  final Trabalhador trabalhadorPrincipal;

  @override
  _TrabalhadorPrincipalState createState() => _TrabalhadorPrincipalState();
}

class _TrabalhadorPrincipalState extends State<TrabalhadorPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trabalhador Principal',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(height: 15),
          Wrap(
            direction: Axis.horizontal,
            spacing: 5,
            children: [
              if (widget.trabalhadorPrincipal != null)
                MiniPhotoProfile(
                  imageProvider:
                      (widget.trabalhadorPrincipal.urlDaFoto == null ||
                              widget.trabalhadorPrincipal.urlDaFoto == '')
                          ? AssetImage('assets/profile.JPG')
                          : FileImage(
                              File(widget.trabalhadorPrincipal.urlDaFoto),
                            ),
                ),
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
