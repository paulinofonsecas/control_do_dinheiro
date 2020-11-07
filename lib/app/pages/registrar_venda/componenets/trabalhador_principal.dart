import 'dart:io';

import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:flutter/material.dart';

import 'custom_btn_add.dart';
import 'escolher_trabalhador.dart';
import 'mini_photo_profile.dart';

class TrabalhadorPrincipal extends StatefulWidget {
  const TrabalhadorPrincipal({
    Key key,
    @required this.trabalhadores,
  }) : super(key: key);

  final List<Trabalhador> trabalhadores;

  @override
  _TrabalhadorPrincipalState createState() => _TrabalhadorPrincipalState();
}

class _TrabalhadorPrincipalState extends State<TrabalhadorPrincipal> {
  Trabalhador trabalhadorPrincipal;

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
              if (trabalhadorPrincipal != null)
                MiniPhotoProfile(
                  imageProvider: (trabalhadorPrincipal.urlDaFoto == null ||
                          trabalhadorPrincipal.urlDaFoto == '')
                      ? AssetImage('assets/profile.JPG')
                      : FileImage(
                          File(trabalhadorPrincipal.urlDaFoto),
                        ),
                ),
              CustomBtnAdd(
                icon: Icons.remove,
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
                          only: true,
                          trabalhadores: widget.trabalhadores,
                          trabalhadoresSelecionados: [trabalhadorPrincipal],
                        );
                      },
                    ),
                  );
                  if (trabalhadoresRetornados != null)
                    setState(() {
                      trabalhadorPrincipal = trabalhadoresRetornados.first;
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
