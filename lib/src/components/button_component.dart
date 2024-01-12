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
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: ElevatedButton(
        onPressed: onTap,
        style: const ButtonStyle(
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
        child: Text(title),
      ),
    );
  }
}
