import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {},
      validator: (value) {
        if (value == null) return 'Campo es requerido';
        if (value.isEmpty) return 'Campo es requerido';
        if (value.trim().isEmpty) return 'Campo es requerido';

        return null;
      },
    );
  }
}
