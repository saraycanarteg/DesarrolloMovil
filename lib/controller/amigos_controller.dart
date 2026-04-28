import 'package:leccion/model/amigos_model.dart';
class AmigosController {

  String procesar(String numeroa, String numerob) {

    final numa = int.tryParse(numeroa);
    final numb = int.tryParse(numerob);

    if (numa == null || numb == null) {
      return 'Ingrese valores válidos';
    }

    if (numa < 0 || numa < 0) {
      return 'Debe ingresar valores positivos';
    }

    final comparacion = AmigosModel.calcular(numa, numb);

    return '''
      Número A: $numa
      Número B: $numb
      Resultado: ${comparacion.sonAmigos}
    ''';
  }
}