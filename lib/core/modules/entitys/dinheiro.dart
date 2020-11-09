class Dinheiro {
  final int idDinheiro;
  final List<int> idTrabalhadorAuxiliares;
  final int idTrabalhadorPrincipal;
  final double entrada;
  final double saida;
  final DateTime data;

  Dinheiro({
    this.idDinheiro,
    this.entrada,
    this.saida,
    this.data,
    this.idTrabalhadorPrincipal,
    this.idTrabalhadorAuxiliares,
  });
}
