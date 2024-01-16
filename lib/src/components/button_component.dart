import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    super.key,
    required this.title,
    required this.onTap,
    required this.radius,
    required this.color,
  });

  final String title;
  final Function() onTap;
  final int radius;
  final int color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius.toDouble()),
          ),
        ),
        elevation: const MaterialStatePropertyAll(0),
        minimumSize: const MaterialStatePropertyAll(
          Size(double.infinity, 40),
        ),
        foregroundColor: const MaterialStatePropertyAll(
          Colors.white,
        ),
        backgroundColor: MaterialStatePropertyAll(
          Color(color),
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}
