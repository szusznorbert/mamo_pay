import 'package:flutter/material.dart';
import 'package:mamo_pay/presentation/design/font_sizes.dart';
import 'package:mamo_pay/presentation/design/icon_sizes.dart';
import 'package:mamo_pay/presentation/design/spacing_sizes.dart';

class CircleButtonWithText extends StatelessWidget {
  final Icon icon;
  final String text;
  final Function() onPressed;

  const CircleButtonWithText({super.key, required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: IconSizes.extraLarge,
          width: IconSizes.extraLarge,
          child: FloatingActionButton(
            heroTag: icon,
            onPressed: onPressed,
            shape: const CircleBorder(),
            elevation: 0,
            child: icon,
            backgroundColor: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(SpacingSizes.xs),
          child: Text(
            text,
            style: TextStyle(fontSize: FontSizes.small, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
