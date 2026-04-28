import 'package:flutter/material.dart';
import 'view/amigos_view.dart';

void main() {
  runApp(Amigos());
}

class  Amigos extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ejercicios",
      theme: ThemeData(primaryColor: Colors.blue),
      home: AmigosPage(),
    );
  }
}