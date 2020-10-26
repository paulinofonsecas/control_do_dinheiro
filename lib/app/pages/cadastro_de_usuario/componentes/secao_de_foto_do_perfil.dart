import 'package:flutter/material.dart';

class SecapDeFotoDoPerfil extends StatelessWidget {
  const SecapDeFotoDoPerfil({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(90),
          ),
          child: Center(
            child: Icon(
              Icons.person,
              size: 90,
              color: Colors.white,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.photo_camera,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            SizedBox(width: 20),
            IconButton(
              icon: Icon(
                Icons.upload_file,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}