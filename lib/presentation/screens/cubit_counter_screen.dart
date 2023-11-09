import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //aqui se extrae la clase counterview y se envuelve
    //en widget bloc provider y ocupa el create que llama al metodo que controla mi estado
    //por lo que esta envuelto en este provider es lo que va a tener acceso al estado
    return BlocProvider(
        create: (_) => CounterCubit(), child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  //otra forma para que no se repita el llamado al estado en los botones
  //es hacer un metodo que llame al bloc

  void increaseCounterBy(BuildContext context,[int value=1]) {
    context.read<CounterCubit>().increaseBy(value);
  }
//finaliza este ejemplo de metodo

  @override
  Widget build(BuildContext context) {
    //aqui podemos estar escuchando los cambios en el estado
    final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Counter: ${counterState.transactionCount}'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                //aqui escucho los cambios en el estado y llama el metodo que tengo en ese estado
                context.read<CounterCubit>().reset();
              },
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: Center(
        //aqui envolvemos el texto porque es solo lo que va a cambiar el estado
        //con el blocbuilder eso es lo bueno de cubits solo redibuja los que ocupamos
        child: BlocBuilder<CounterCubit, CounterState>(
          // buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            return Text('Counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: '1',
              child: const Text('+3'),
              onPressed: () => context.read<CounterCubit>().increaseBy(3)),
              //asi es como puedo usar el metodo de ejemplo creado arriba
             // onPressed: () => increaseCounterBy(context,3)),
          const SizedBox(height: 15),
          FloatingActionButton(
              heroTag: '2',
              child: const Text('+2'),
              onPressed: () => context.read<CounterCubit>().increaseBy(2)),
          const SizedBox(height: 15),
          FloatingActionButton(
              heroTag: '3',
              child: const Text('+1'),
              onPressed: () => context.read<CounterCubit>().increaseBy(1)),
        ],
      ),
    );
  }
}
