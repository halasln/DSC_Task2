import 'dart:math';

class BmiCalcul {
  BmiCalcul(this.weight, this.height);
  final int height;
  final int weight;
  double result;
  String msg = 'Normal';

  String bmiCalcul() {
    result = weight / pow(height / 100, 2);
    return result.toStringAsFixed(1);
  }

  String getDescripition(result) {
    if (result >= 25) {
      msg = "Overweight";
      return '25.0—29.9 \nYou have a higher than normal body weight. Try to exercise more.';
    } else if (result >= 18.5) {
      msg = "Normal";
      return '18.5—24.9 \n You have a normal body weight. Good job!';
    } else {
      msg = "Underweight";
      return 'Below 18.5 \n You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  String getMsg(result) {
    if (result >= 25) {
      return "Overweight";
    } else if (result >= 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }
}
