import 'package:flutter/material.dart';

class SecondaryButtonComponent extends StatelessWidget {
  const SecondaryButtonComponent({
    super.key,
    required this.color,
    required this.title,
    required this.onTap,
    required this.width,
    required this.height,
  });

  final Color color;
  final String title;
  final Function() onTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        minimumSize: MaterialStatePropertyAll(
          Size(width, height),
        ),
        elevation: const MaterialStatePropertyAll(0),
        backgroundColor: MaterialStatePropertyAll(color),
        foregroundColor: MaterialStatePropertyAll(Colors.black),
      ),
      onPressed: onTap,
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
