var separador = ' ';

String doisNomes(String nome) {
  if (nome != null) {
    var partesDoNome = nome.split(separador);
    if (partesDoNome.length == 1) {
      return partesDoNome.first;
    } else if (partesDoNome.length >= 2) {
      return '${partesDoNome.first} ${partesDoNome.last}';
    }
  } else {
    throw ArgumentError.notNull('O nome não pode ser null');
  }
}
