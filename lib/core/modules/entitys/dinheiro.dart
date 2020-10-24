abstract class Dinheiro {
  final int idDinheiro;
  final double valorPresente;
  final double valorTotal;
  final DateTime data;
  final List<int> idDosTrabalhadores;

  Dinheiro(
    this.idDinheiro,
    this.valorPresente,
    this.valorTotal,
    this.data,
    this.idDosTrabalhadores,
  );
}
