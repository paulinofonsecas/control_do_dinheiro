import 'package:dartz/dartz.dart';

abstract class BaseDeDados<T> {

  Future<Either<Exception, bool>> inserir(T t);

  Future<Either<Exception, T>> buscarPorId(int id);

  Future<Either<Exception, T>> buscarPorBi(String bi);

  Future<Either<Exception, T>> buscarPorNome(String nome);

  Future<Either<Exception, T>> eliminar(int id);

  Future<Either<Exception, List<T>>> getAll();

}
