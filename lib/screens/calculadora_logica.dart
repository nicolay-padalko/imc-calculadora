import 'dart:math';

class CauladoraLogica {
  CauladoraLogica({this.altura, this.peso});

  final int altura;
  final int peso;

  double _bmi;

  String calculoBMI() {
    _bmi = peso / pow(altura / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Sobrepeso';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Abaixo do peso';
    }
  }

  String getInterpertration() {
    if (_bmi >= 25) {
      return 'Voce está acima do peso, faça mais exercicios.';
    } else if (_bmi > 18.5) {
      return 'Parabens, está dentro do peso.';
    } else {
      return 'Voce está abaixo do peso, pode repetir a pizza.';
    }
  }
}
