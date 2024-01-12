import 'package:flutter/material.dart';

class FieldComponent extends StatelessWidget {
  const FieldComponent({
    super.key,
    required this.icon,
    required this.hint,
    required this.controllerText,
    required this.validator,
    required this.obsecureText,
  });

  final IconData icon;
  final String hint;
  final TextEditingController controllerText;
  final String Function(String?)? validator;
  final bool obsecureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: TextFormField(
        controller: controllerText,
        validator: validator,
        obscureText: obsecureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hint,
          hintStyle: const TextStyle(fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
