import 'dart:io';

import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:flutter/material.dart';

import 'mini_photo_profile.dart';

class TrabalhadorMiniItem extends StatelessWidget {
  const TrabalhadorMiniItem({
    Key key,
    @required this.trabalhador,
    this.isSelected,
    this.onPressed,
  }) : super(key: key);

  final Trabalhador trabalhador;
  final GestureTapCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                MiniPhotoProfile(
                  imageProvider: (trabalhador.urlDaFoto == null ||
                          trabalhador.urlDaFoto == '')
                      ? AssetImage('assets/profile.JPG')
                      : FileImage(
                          File(trabalhador.urlDaFoto),
                        ),
                ),
                SizedBox(width: 10),
                Text(
                  trabalhador.nome,
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ],
            ),
            Icon(
              Icons.verified_outlined,
              color: isSelected ? Colors.green : Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
