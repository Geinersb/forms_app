part of 'counter_cubit.dart';

//aqui creo mi propia clase borro la que crea
// esta clase extiende deEquatable para que cuando mi variable
//no cambia de estado en una acción llamada por boton no realice 
//el proceso de redibujo ya que no esta cambiando el valor del estado de la variable
class CounterState extends Equatable {
  final int counter;
  final int transactionCount;

//creo el constructor 
 const CounterState({
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
    
      @override
      //esto es lo que se crea con el equatable para que evalue si el valor 
      //no cambia entonces no llamar al cambio de estado
      List<Object?> get props =>[counter,transactionCount] ;
}
