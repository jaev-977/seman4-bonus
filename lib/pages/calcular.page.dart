import 'dart:math';

import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  final int edad, peso;
  double estatura;
  final bool genero;
  String resultado = "", mensaje = "";
  double valor = 0;
  Color color = Colors.white;

  // ignore: use_key_in_widget_constructors
  Calculator(
      {required this.edad,
      required this.peso,
      required this.estatura,
      required this.genero});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora IMC"),
        centerTitle: false,
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    _calculo();
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(10, 20, 0, 20),
          child: const Text(
            "Resultado",
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.shade900,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    resultado,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: color),
                  ),
                ),
                Center(
                  child: Text(
                    "$valor",
                    style: const TextStyle(
                        fontSize: 75, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    mensaje,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.pink.shade600,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        textStyle: const TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold)),
                    child: const Text(
                      "Mostrar Resultados",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )))
          ],
        )
      ],
    );
  }

  void _calculo() {
    double e = estatura / 100;

    valor = e * e;
    valor = peso / valor;
    valor = double.parse(valor.toStringAsFixed(1));
    if (valor < 18.5) {
      resultado = "Peso Bajo".toUpperCase();
      mensaje = "Peso bajo, tener precaución";
      color = Colors.yellow;
    } else if (valor < 24.9) {
      resultado = "Peso Normal".toUpperCase();
      mensaje = "Peso ideal";
      color = Colors.green;
    } else if (valor < 29.9) {
      resultado = "Sobrepeso".toUpperCase();
      mensaje = "Peso alto para los datos ";
      color = Colors.yellow;
    } else if (valor < 34.5) {
      resultado = "Obesidad Grado I".toUpperCase();
      mensaje = "sobrepeso  grado I no adecuado";
      color = Colors.amber;
    } else if (valor < 39.9) {
      resultado = "Obesidad Grado II".toUpperCase();
      mensaje = " sobrepeso  grado II. Alerta!";
      color = Colors.orange;
    } else {
      resultado = "Obesidad Grado III".toUpperCase();
      mensaje = "obesidad mórbida o extrema";
      color = Colors.red;
    }
  }
}
