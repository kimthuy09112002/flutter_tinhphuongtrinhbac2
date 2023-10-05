import 'dart:math' as math;

class Math {
  // static danh_sach giaiPhuongTrinhBacHai(parameters)
  static List<double>? giaiPhuongTrinhBacHai(
      {required double a, required double b, required double c}) {
    if ((a == 0) && (b == 0) && (c == 0)) {
      return null;
    }

    if ((a == 0) && (b == 0) && (c != 0)) {
      return [];
    }

    if ((a == 0) && (b != 0)) {
      return [-c / b];
    }

    double delta = b * b - 4 * a * c;

    if (delta == 0) {
      return [-b / (2 * a)];
    }

    if (delta > 0) {
      double x1 = (-b - math.sqrt(delta)) / (2 * a);
      double x2 = (-b + math.sqrt(delta)) / (2 * a);
      return [x1, x2];
    }

    return [];
  }
}

