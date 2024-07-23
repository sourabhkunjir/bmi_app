import 'package:flutter_riverpod/flutter_riverpod.dart';

// Height state provider with initial value of 120
final heightProvider = StateProvider<double>((ref) => 120);

// Weight state provider with a notifier
class WeightNotifier extends StateNotifier<int> {
  WeightNotifier() : super(60);

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}

final weightProvider = StateNotifierProvider<WeightNotifier, int>((ref) => WeightNotifier());

// Age state provider with a notifier
class AgeNotifier extends StateNotifier<int> {
  AgeNotifier() : super(25);

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}

final ageProvider = StateNotifierProvider<AgeNotifier, int>((ref) => AgeNotifier());
