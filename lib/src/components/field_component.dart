import 'package:flutter/material.dart';

class FieldComponent extends StatelessWidget {
  const FieldComponent({
    super.key,
    required this.icon,
    required this.hint,
    required this.controllerText,
  });

  final IconData icon;
  final String hint;
  final TextEditingController controllerText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: TextField(
        controller: controllerText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hint,
          hintStyle: const TextStyle(fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
