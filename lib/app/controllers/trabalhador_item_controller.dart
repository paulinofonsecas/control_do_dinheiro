import 'package:control_do_dinheiro/app/cubits/cadastro_de_trabalhadores/cadastro_de_trabalhadores_cubit.dart';
import 'package:control_do_dinheiro/app/pages/cadastro_de_trabalhador/cadastro_de_trabalhador_page.dart';
import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:control_do_dinheiro/core/modules/usecases/leitor.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrabalhadorController {
  final BuildContext context;
  TrabalhadorController(this.context);

  Future<List<Trabalhador>> get trabalhadores async {
    Either<Exception, List<Trabalhador>> result = await todosTrabalhadores();
    if (result is Right) {
      return result | [];
    } else {
      return [];
    }
  }

  irParaAtelaDeCadastroDeTrabalhadores() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (con) => CadastroDeTrabalhadoresCubit(con),
          child: CadastroDeTrabalhador(),
        ),
      ),
    );
  }
}
