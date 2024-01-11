import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(title),
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll(
          Size(double.infinity, 35),
        ),
        foregroundColor: MaterialStatePropertyAll(
          Colors.white,
        ),
        backgroundColor: MaterialStatePropertyAll(
          Color(0xffFF6000),
        ),
      ),
    );
  }
}
