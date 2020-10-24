import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:control_do_dinheiro/core/modules/entitys/usuario.dart';
import 'package:control_do_dinheiro/core/modules/erros/entidades.dart';
import 'package:control_do_dinheiro/core/modules/repositorios/repositorio_de_trabalhadores.dart';
import 'package:control_do_dinheiro/core/modules/repositorios/repositorio_de_usuarios.dart';
import 'package:control_do_dinheiro/core/modules/usecases/cadastro.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class RepositorioDeTrabalhadoresMock extends Mock
    implements IRepositorioDeTrabalhadores {}

class RepositorioDeUsuariosMock extends Mock implements IRepositorioDeUsuarios {
}

void main() {
  group('Cadastro de trabalhador', () {
    IRepositorioDeTrabalhadores _repositorio;
    Cadastrar _cadastrar;
    setUp(() async {
      _repositorio = RepositorioDeTrabalhadoresMock();
      _cadastrar = Cadastrar.trabalhador(_repositorio);
    });

    test('Sucesso ao cadastrar um trabalhador', () async {
      when(_repositorio.cadastrar(any)).thenAnswer((_) async => Right(true));
      var result = await _cadastrar.cadastrarTrabalhador(Trabalhador());
      var expected = result.getOrElse(() => false);
      expect(expected, true);
    });

    test('Cadastro com um trabalhador null', () async {
      var result = await _cadastrar.cadastrarTrabalhador(null);
      expect(result.swap().getOrElse(() => null), isA<EntidadeNulla>());
    });

    test('Falha interna ao cadastrar', () async {
      when(_repositorio.cadastrar(any))
          .thenAnswer((_) async => Left(Exception()));

      var result = await _cadastrar.cadastrarTrabalhador(Trabalhador());
      expect(result, isA<Left>());
      expect(result.swap() | null, isA<Exception>());
    });
  });

  group('Cadastro de usuario', () {
    IRepositorioDeUsuarios _repositorio;
    Cadastrar _cadastrar;
    setUp(() {
      _repositorio = RepositorioDeUsuariosMock();
      _cadastrar = Cadastrar.usuario(_repositorio);
    });

    test('Sucesso ao cadastrar um usuario', () async {
      when(_repositorio.cadastrar(any)).thenAnswer((_) async => Right(true));
      var result = await _cadastrar.cadastrarUsuario(Usuario());
      expect(result | false, true);
    });

    test('Cadastro com um usuario null', () async {
      var result = await _cadastrar.cadastrarUsuario(null);
      expect(result.swap() | null, isA<EntidadeNulla>());
    });

    test('Falha interna ao cadastrar', () async {
      when(_repositorio.cadastrar(any))
          .thenAnswer((_) async => Left(Exception()));

      var result = await _cadastrar.cadastrarUsuario(Usuario());
      expect(result, isA<Left>());
      expect(result.swap() | null, isA<Exception>());
    });
  });
}
