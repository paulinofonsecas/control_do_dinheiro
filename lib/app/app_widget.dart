import 'package:flutter/material.dart';

import 'pages/login_de_usuario/login_usuario_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moagem Money',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginUsuarioPage(),
    );
  }
}
