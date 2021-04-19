import 'dart:math';

class Helper {
  Helper._();

  static int getRandomNum(int min, int max) {
    Random _random = new Random();

    return min + _random.nextInt(max - min);
  }
}
