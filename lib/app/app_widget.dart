import 'package:control_do_dinheiro/app/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Moagem Money',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color(0xff282936),
        ),
        home: HomePage()
        // home: BlocProvider(
        //   child: LoginUsuarioPage(),
        //   create: (_) => LoginDeUsuarioCubit(_),
        // ),
        );
  }
}
