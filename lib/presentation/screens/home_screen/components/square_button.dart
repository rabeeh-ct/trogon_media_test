import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import '../../../widgets/app_text.dart';

class SquareButton extends StatelessWidget {
  const SquareButton({
    super.key,
    required this.imagePath,
    required this.text,
    required this.onPress,
    required this.firstColor,
    required this.secondColor,
  });

  final String imagePath;
  final String text;
  final VoidCallback onPress;
  final Color firstColor;
  final Color secondColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: 90,
        height: 86,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              firstColor,
              secondColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  "assets/images/$imagePath.png",
                  height: 40,
                  width: 40,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: firstColor,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
              width: double.maxFinite,
              height: 20,
              alignment: Alignment.center,
              child: AppText(
                text,
                weight: FontWeight.w500,
                size: 12,
                color: whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
