import 'dart:async';
import 'game.dart';

void main() {
  final game = Game();

  // tää on ihan demo vaan
  Timer(const Duration(seconds: 5), game.stop);
}
