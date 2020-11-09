class Dinheiro {
  final int idDinheiro;
  final List<int> idDosAuxiliares;
  final int idTrabalhador;
  final double entrada;
  final double saida;
  final DateTime data;

  Dinheiro({
    this.idDinheiro,
    this.entrada,
    this.saida,
    this.data,
    this.idTrabalhador,
    this.idDosAuxiliares,
  });
}
