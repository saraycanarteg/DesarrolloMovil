import 'package:flutter/material.dart';
import 'package:leccion/controller/amigos_controller.dart';

//********************** atomos **********************
class Label extends StatelessWidget{
  final String text;
  Label(this.text, {super.key});

  @override
  Widget build(BuildContext context)  =>
      Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),);
}

class NumberField extends StatelessWidget{
  final TextEditingController controller;
  final String hint;

  NumberField({super.key, required this.controller, required this.hint});

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: hint,
      border: OutlineInputBorder(),
    ),
  );
}

class PrimaryButton extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;
  PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context)  =>
      ElevatedButton(onPressed: onPressed, child: Text(text));
}

//************************ molecula *********************************************
class NumberInput extends StatelessWidget{
  final TextEditingController numaC, numbC;

  NumberInput({super.key, required this.numaC, required this.numbC});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: NumberField(controller: numaC, hint: 'Número A entero positivo',)),
        SizedBox(width: 10,),
        Expanded(child: NumberField(controller: numbC, hint: 'Número B entero positivo',)),
        SizedBox(width: 10,),
      ],
    );
  }
}


//***************************** organismo *********************************************
class AmigosCard extends StatefulWidget{
  AmigosCard({super.key});

  @override
  State<AmigosCard> createState() => _AmigosCardState();
}

class _AmigosCardState extends State<AmigosCard>{
  final _ctrlnuma = TextEditingController();
  final _ctrlnumb = TextEditingController();
  String _resultado = '';

  //instanciar controller
  final _controller = AmigosController();

  //metodo
  void _calcular(){
    setState(() {
      _resultado = _controller.procesar(_ctrlnuma.text, _ctrlnumb.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Label('Ingrese Dos Números Enteros Positivos'),
            SizedBox(height: 10,),
            NumberInput(numaC: _ctrlnuma, numbC: _ctrlnumb),
            SizedBox(height: 10,),
            PrimaryButton(text: 'Verificar si son Amigos', onPressed: _calcular),
            SizedBox(height: 10,),
            Label(_resultado),
          ],
        ),

      ),
    );
  }
}

//4. Pagina
class AmigosPage extends StatelessWidget {
  AmigosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cálculo de Cambio'),
        backgroundColor: Colors.lightBlueAccent,),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: AmigosCard(),
      ),
    );
  }
}