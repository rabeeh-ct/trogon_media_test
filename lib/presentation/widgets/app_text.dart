import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.color,
    this.size = 14,
    this.align,
    this.maxLines,
    this.family,
    this.weight,
    this.style,
    this.overflow,
    this.height=1.6,
  });

  final dynamic text;
  final String? family;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final TextAlign? align;
  final int? maxLines;
  final TextStyle? style;
  final TextOverflow? overflow;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Text('${text ?? ''}',
        maxLines: maxLines,
        overflow: overflow,
        style: style ??
            TextStyle(
                height: height,
                fontSize: size,
                color: color,
                fontWeight: weight,
                fontFamily: family),
        textAlign: align);
  }
}
