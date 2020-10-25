class ErrosInternos implements Exception {}

class ErroInterno extends ErrosInternos {}

class FalhaAoInserirNoBD extends ErrosInternos {}

class ElementoNaoExistenteNaBD extends ErrosInternos {}

class BDVazia extends ErrosInternos {}
