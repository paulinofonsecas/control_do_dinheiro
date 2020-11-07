import 'package:control_do_dinheiro/core/modules/entitys/dinheiro.dart';
import 'package:control_do_dinheiro/core/modules/repositorios/i_repositorio_de_dinheiro.dart';
import 'package:dartz/dartz.dart';

IRepositorioDeDinheiro _repositorio;
Future<Either<Exception, bool>> registrar(Dinheiro dinheiro) async {
  if (dinheiro == null)
    throw ArgumentError.notNull(
        'O dinheiro a ser cadastrado não deve ser null');
  var result = _repositorio.registrar(dinheiro);
  return result;
}
