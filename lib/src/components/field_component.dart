import 'package:flutter/material.dart';

class FieldComponent extends StatefulWidget {
  const FieldComponent({
    super.key,
    required this.icon,
    required this.hint,
    required this.controllerText,
    // required this.validator,
    required this.obsecureText,
  });

  final IconData icon;
  final String hint;
  final TextEditingController controllerText;
  // final String Function(String) validator;
  final bool obsecureText;

  @override
  State<FieldComponent> createState() => _FieldComponentState();
}

class _FieldComponentState extends State<FieldComponent> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controllerText,
      // validator: widget.validator,
      obscureText: widget.obsecureText && !_isVisible,
      decoration: InputDecoration(
        errorStyle: Theme.of(context)
            .textTheme
            .displaySmall
            ?.copyWith(color: Colors.red),
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: const Color(0xffE9E9E9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(
          widget.icon,
          color: const Color(0xffBABABA),
          size: 24,
        ),
        hintText: widget.hint,
        hintStyle: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(color: const Color(0xffBABABA)),
        suffixIcon: widget.obsecureText == true
            ? IconButton(
                color: const Color(0xffBABABA),
                icon: Icon(
                  _isVisible ? Icons.visibility : Icons.visibility_off,
                  size: 24,
                ),
                onPressed: () => setState(() {
                  _isVisible = !_isVisible;
                }),
              )
            : const Text(""),
      ),
    );
  }
}
