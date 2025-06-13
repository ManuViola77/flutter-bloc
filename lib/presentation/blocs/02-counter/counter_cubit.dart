import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(5);

  void increment() {
    emit(state + 1);
  }

  void incrementBy(int incrementAmount) {
    emit(state + incrementAmount);
  }

  void decrementBy(int decrementAmount) {
    emit(state - decrementAmount);
  }
}
