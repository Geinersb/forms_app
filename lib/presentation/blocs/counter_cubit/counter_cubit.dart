import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

//se llama al counterState que es como se llama mi estado
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 5));

//aqui hago un metodo el cual llama la copia del estado 
//y cambia el valor de las variables en el estado
  void increaseBy(int value) {
    emit(state.copyWith(
        counter: state.counter + value,
        transactionCount: state.transactionCount + 1
        ));
  }
//aqui el metodo lo que hace es restablecer el valor 
//del contador y lo cambia en el estado en la variable counter
//haciendolo con el copy with no es necesario llamar todas las variables
//puedo llamar solo las que quiero modificar 
  void reset() {
     emit(state.copyWith(
        counter: 0,
       
        ));
  }
}
