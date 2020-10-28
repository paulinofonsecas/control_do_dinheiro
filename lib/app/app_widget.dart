import 'package:control_do_dinheiro/app/cubits/login_de_usuario/login_de_usuario_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      home: BlocProvider(
        child: LoginUsuarioPage(),
        create: (_) => LoginDeUsuarioCubit(_),
      ),
    );
  }
}
