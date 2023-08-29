import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

import '../resources/colors.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback? press;
  final bool disabled;
  final Color? color;
  final Color? borderColor;
  final TextStyle? textStyle;
  final double? height;
  final double? width;

  const RoundedButton({
    Key? key,
    required this.text,
    this.press,
    this.color,
    this.borderColor,
    this.textStyle,
    this.width,
    this.height,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(
                color: borderColor ?? colorShadowButton,
              ),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all<Color>(color ?? colorPrimary),
        ),
        onPressed: press,
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: textStyle ??
                    const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
