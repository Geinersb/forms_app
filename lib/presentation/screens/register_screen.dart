import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nuevo Usuario'),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) => RegisterCubit(),
          child: const _RegisterView(),
        ));
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlutterLogo(
              size: 100,
            ),
            SizedBox(height: 20),
            _RegisterForm(),
            SizedBox(height: 20),
          ],
        ),
      ),
    ));
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;
    

    return Form(
        child: Column(
      children: [
        CustomTextFormField(
          label: 'Nombre de Usuario',
          onChanged: registerCubit.usernameChanged,
          errorMessage: username.errorMessage,
          icon: const Icon(Icons.supervised_user_circle_outlined,
              color: Colors.purpleAccent),
        ),

        const SizedBox(height: 10),

        CustomTextFormField(
          label: 'Correo eléctronico',
          onChanged: registerCubit.emailChanged,
          errorMessage: email.errorMessage,
          icon: const Icon(Icons.email_outlined, color: Colors.purpleAccent),
        ),

        const SizedBox(height: 10),

        CustomTextFormField(
          label: 'Contraseña',
          onChanged: registerCubit.passwordChanged,
           errorMessage: password.errorMessage,
          icon: const Icon(Icons.password_outlined, color: Colors.purpleAccent),
          obscureText: true,
        ),

        const SizedBox(height: 20),

        FilledButton.tonalIcon(
            onPressed: () {
              // final isValid = _formKey.currentState!.validate();
              // if (!isValid) return;

              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text('Crear Usuario')),
      ],
    ));
  }
}
