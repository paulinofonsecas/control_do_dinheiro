import 'package:control_do_dinheiro/app/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SwitchMode(),
      child: BlocBuilder<SwitchMode, bool>(
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Moagem Money',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: state ? Brightness.dark : Brightness.light,
          ),
          home: HomePage(),
          // home: BlocProvider(
          //   child: LoginUsuarioPage(),
          //   create: (_) => LoginDeUsuarioCubit(_),
          // ),
        ),
      ),
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
