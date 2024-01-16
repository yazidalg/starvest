import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BottomAuthWidget extends StatelessWidget {
  const BottomAuthWidget({
    super.key,
    required this.title,
    required this.titleButton,
    required this.page,
  });

  final String title;
  final String titleButton;
  final Function() page;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.090,
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.labelSmall,
          text: title,
          children: [
            TextSpan(
              text: titleButton,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: const Color(0xffF98930)),
              recognizer: TapGestureRecognizer()..onTap = page,
            ),
          ],
        ),
      ),
    );
  }
}
