import 'package:forms_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

//aqui configuro las rutas para cambiar de pantallas

final appRouter = GoRouter(
  routes: [
GoRoute(
  path: '/',
  builder: (context, state) => const HomeScreen() ,
),
GoRoute(
  path: '/cubits',
  builder: (context, state) => const CubitCounterScreen() ,
),

  ]
  
  
  
  );