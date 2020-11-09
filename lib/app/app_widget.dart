import 'package:control_do_dinheiro/app/pages/home_page/home_page.dart';
import 'package:control_do_dinheiro/app/pages/login_de_usuario/login_usuario_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/cadastro_de_trabalhadores/cadastro_de_trabalhadores_cubit.dart';
import 'cubits/login_de_usuario/login_de_usuario_cubit.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moagem Money',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        scaffoldBackgroundColor: Color(0xff282936),
        // brightness: state ? Brightness.dark : Brightness.light,
      ),
      // home: HomePage(),
      home: BlocProvider(
        create: (_) => LoginDeUsuarioCubit(_),
        child: LoginUsuarioPage(),
      ),
    );
  }
}