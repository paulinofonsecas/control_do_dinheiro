import 'package:control_do_dinheiro/app/pages/home_page/componentes/registro_item.dart';
import 'package:control_do_dinheiro/core/data/datasource/datasource_dinheiro.dart';
import 'package:control_do_dinheiro/core/data/datasource/datasource_trabalhadores.dart';
import 'package:control_do_dinheiro/core/data/models/base_de_dados_implements/base_de_dados_de_trabalhadores.dart';
import 'package:control_do_dinheiro/core/data/models/base_de_dados_implements/base_de_dados_do_dinheiro.dart';
import 'package:control_do_dinheiro/core/data/repositorios/repositorio_de_dinheiro.dart';
import 'package:control_do_dinheiro/core/data/repositorios/repositorio_de_trabalhadores.dart';
import 'package:control_do_dinheiro/core/modules/entitys/dinheiro.dart';
import 'package:control_do_dinheiro/core/modules/entitys/trabalhador.dart';
import 'package:control_do_dinheiro/core/modules/repositorios/i_repositorio_de_dinheiro.dart';
import 'package:control_do_dinheiro/core/modules/repositorios/i_repositorio_de_trabalhadores.dart';

IRepositorioDeTrabalhadores _repositorioDeTrabalhadores;
IRepositorioDeDinheiro _repositorioDeDinheiro;

void _configuracaoDoRepositorioDeTrabalhadores() {
  BaseDeDadosDeTrabalhadoresImpl _baseDeDados =
      BaseDeDadosDeTrabalhadoresImpl();
  IDataSourceTrabalhador _dataSource = DataSourceTrabalhador(_baseDeDados);
  _repositorioDeTrabalhadores = RepositorioDeTrabalhadores(_dataSource);
}

void _configuracaoDoRepositorioDoDinheiro() {
  BaseDeDadosDoDinheiro _baseDeDados = BaseDeDadosDoDinheiro();
  IDataSourceDinheiro _dataSource = DataSourceDinheiro(_baseDeDados);
  _repositorioDeDinheiro = RepositorioDeDinheiro(_dataSource);
}

Future<Trabalhador> _getTrabalhadorWithId(int idTrabalhador) async {
  var trabalhadorSearch =
      await _repositorioDeTrabalhadores.buscarTrabalhadorPorId(idTrabalhador);
  var trabalhador = trabalhadorSearch | null;
  return trabalhador;
}

Future<void> _criarRegistros(Dinheiro dinheiro, List<Registro> regis) async {
  var trabalhador = await _getTrabalhadorWithId(dinheiro.idTrabalhador);
  List<Trabalhador> auxialiares = [];
  dinheiro.idDosAuxiliares.forEach((idTrabalhador) async {
    var aux = await _getTrabalhadorWithId(idTrabalhador);
    auxialiares.add(aux);
  });
  regis.add(Registro(
    trabalhador: trabalhador,
    trabalhadoresAuxiliares: auxialiares,
    nomeDoFuncionario: trabalhador.nome,
    entrada: dinheiro.entrada,
    saida: dinheiro.saida,
    dateTime: dinheiro.data,
  ));
}

Future<List<Registro>> registros() async {
  var dinheiroList = (await _repositorioDeDinheiro.todoODinheiro()) | [];
  List<Registro> regis = [];
  for (var dinheiro in dinheiroList) {
    await _criarRegistros(dinheiro, regis);
  }
  regis.sort((r1, r2) => r1.dateTime.compareTo(r2.dateTime));
  return regis.reversed.toList();
}
