class AmigosModel {
  final int numa, numb, sumaa, sumab;
  final String sonAmigos;

  AmigosModel({
    required this.numa,
    required this.numb,
    required this.sumaa,
    required this.sumab,
    required this.sonAmigos
  });

  static AmigosModel calcular(int numa, int numb) {
    int sumaA = 0;
    int sumaB = 0;
    String resultado;

    for (int inicio = 1; inicio < numa; inicio++) {
      if (numa % inicio == 0) {
        sumaA += inicio;
      }
    }

    for (int inicio = 1; inicio < numb; inicio++) {
      if (numb % inicio == 0) {
        sumaB += inicio;
      }
    }

    if (sumaA == numb && sumaB == numa) {
      resultado = 'Los números son amigos';
    } else {
      resultado = 'Los números no son amigos';
    }

    return AmigosModel(
      numa: numa,
      numb: numb,
      sumaa: sumaA,
      sumab: sumaB,
      sonAmigos: resultado,
    );
  }
}