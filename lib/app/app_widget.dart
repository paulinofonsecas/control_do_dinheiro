import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moagem Money',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: CadastrarUsuarioPage(),
    );
  }
}

class CadastrarUsuarioPage extends StatefulWidget {
  @override
  _CadastrarUsuarioPageState createState() => _CadastrarUsuarioPageState();
}

class _CadastrarUsuarioPageState extends State<CadastrarUsuarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}