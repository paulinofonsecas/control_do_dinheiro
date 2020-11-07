import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:control_do_dinheiro/core/modules/usecases/leitor.dart';
import 'package:dartz/dartz.dart';

class TrabalhadorController {
  Future<List<Trabalhador>> get trabalhadores async {
    Either<Exception, List<Trabalhador>> result = await todosTrabalhadores();
    if (result is Right) {
      return result | [];
    } else {
      return [];
    }
  }

  double totalDeEntradas(Trabalhador trabalhador) {}
}
