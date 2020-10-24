abstract class Dinheiro {
  final int idDinheiro;
  final int idTrabalhador;
  final double valorPresente;
  final double valorTotal;
  final DateTime data;

  Dinheiro(
    this.idDinheiro,
    this.valorPresente,
    this.valorTotal,
    this.data,
    this.idTrabalhador,
  );
}
