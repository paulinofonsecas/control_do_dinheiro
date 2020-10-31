import 'package:control_do_dinheiro/app/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/cadastro_de_trabalhadores/cadastro_de_trabalhadores_cubit.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moagem Money',
      builder: (context, navigator) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => SwitchMode()),
          ],
          child: navigator,
        );
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xff282936),
        // brightness: state ? Brightness.dark : Brightness.light,
      ),
      home: HomePage(),
      // home: BlocProvider(
      //   child: LoginUsuarioPage(),
      //   create: (_) => LoginDeUsuarioCubit(_),
      // ),
    );
  }
}

class SwitchMode extends Cubit<bool> {
  bool value;
  SwitchMode() : super(true) {
    value = false;
  }

  switcher() => value = !value;
}
