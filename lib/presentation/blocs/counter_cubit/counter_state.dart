part of 'counter_cubit.dart';

//aqui creo mi propia clase borro la que crea
class CounterState {
  final int counter;
  final int transactionCount;

//creo el constructor 
  CounterState({
    this.counter = 0, 
    this.transactionCount = 0
    });

//se hace una copia del estado actual que seria lo de arriba
  copyWith({
    int? counter,
    int? transactionCount,
  }) => CounterState(
    //asigan el valor que recibe y si no viene nada entonces
    //entonces asigna los valores quemados de arriba
          counter: counter ?? this.counter,
          transactionCount: transactionCount ?? this.transactionCount
    );
}
