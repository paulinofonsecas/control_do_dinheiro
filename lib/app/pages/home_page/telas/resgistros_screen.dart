import 'package:control_do_dinheiro/app/pages/home_page/componentes/registro_item.dart';
import 'package:flutter/material.dart';

class RegistroScreen extends StatelessWidget {
  RegistroScreen({
    Key key,
  }) : super(key: key);

  final registros = [
    Registro(
        nomeDoFuncionario: 'Cailoy',
        entrada: 18000,
        saida: 1500,
        dateTime: DateTime.now()),
    Registro(
        nomeDoFuncionario: 'Mario',
        entrada: 16500,
        saida: 2500,
        dateTime: DateTime.now()),
    Registro(
        nomeDoFuncionario: 'Zeca',
        entrada: 17150,
        saida: 3000,
        dateTime: DateTime.now()),
    Registro(
        nomeDoFuncionario: 'Kapapelo',
        entrada: 22300,
        saida: 500,
        dateTime: DateTime.now()),
    Registro(
        nomeDoFuncionario: 'Cailoy',
        entrada: 24850,
        saida: 1000,
        dateTime: DateTime.now()),
    Registro(
        nomeDoFuncionario: 'Cailoy',
        entrada: 10220,
        saida: 2200,
        dateTime: DateTime.now()),
    Registro(
        nomeDoFuncionario: 'Cailoy',
        entrada: 7000,
        saida: 200,
        dateTime: DateTime.now()),
    Registro(
        nomeDoFuncionario: 'Mario',
        entrada: 8350,
        saida: 500,
        dateTime: DateTime.now()),
    Registro(
        nomeDoFuncionario: 'Zeca',
        entrada: 14200,
        saida: 6000,
        dateTime: DateTime.now()),
    Registro(
        nomeDoFuncionario: 'Kapapelo',
        entrada: 5300,
        saida: 8000,
        dateTime: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff282936),
        body: Column(
          children: [
            _buildCustomAppBar(),
            SizedBox(height: 25),
            Expanded(
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
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff41d1e2),
          child: Icon(
            Icons.add,
            color: Color(0xff282936)
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  bool get isEmpty => registros.isEmpty;

  Widget _buildCustomAppBar() {
    return CustomAppBar(
      isEmpty: registros.isEmpty,
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

class CustomAppBar extends StatelessWidget {
  final bool isEmpty;
  final List<Widget> actions;
  final String title;
  const CustomAppBar({
    Key key,
    this.isEmpty,
    this.actions,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Row(
              children: actions,
            ),
          ],
        ),
      ),
    );
  }
}
