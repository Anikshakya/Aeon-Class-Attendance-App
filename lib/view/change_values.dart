import 'package:flutter/material.dart';

class CheckInValues {
  var buttonText = "チェックインしました";
  linearGradient() {
    return const LinearGradient(
      colors: [
        Color.fromARGB(255, 126, 211, 33),
        Color.fromARGB(255, 255, 77, 44),
      ],
    );
  }

  buttonColor() {
    return const Color.fromARGB(255, 126, 211, 23);
  }
}

class CheckOutValues {
  var buttonText = "チェックアウトしました";
  linearGradient() {
    return const LinearGradient(
      colors: [
        Color.fromARGB(255, 88, 86, 214),
        Color.fromARGB(255, 255, 77, 44),
      ],
    );
  }

  buttonColor() {
    return const Color.fromARGB(255, 88, 86, 214);
  }
}

class NoClass {
  var buttonText = "クラスがありません";
  linearGradient() {
    return const LinearGradient(
      colors: [
        Color.fromARGB(255, 210, 48, 120),
        Color.fromARGB(255, 255, 77, 44),
      ],
    );
  }

  buttonColor() {
    return const Color.fromARGB(255, 210, 48, 120);
  }
}

class NoValidId {
  var buttonText = "チェックインできません";
  var errorMessage = "会員番号エラー";
  linearGradient() {
    return const LinearGradient(
      colors: [
        Color.fromARGB(255, 210, 48, 120),
        Color.fromARGB(255, 255, 77, 44),
      ],
    );
  }

  buttonColor() {
    return const Color.fromARGB(255, 210, 48, 120);
  }
}
