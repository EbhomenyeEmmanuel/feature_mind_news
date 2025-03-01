import 'package:flutter/material.dart';
import 'package:feature_mind_news/common/utils/extensions.dart';

import '../../utils/colors.dart';

/// Custom Button Widget for easy reuse
class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color textColor;
  final bool isLoading;
  final bool isEnabled;
  final double height;
  final double? width;
  final Color color;
  final EdgeInsets? padding;

  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.textColor = Colors.white,
      this.isLoading = false,
      this.isEnabled = true,
      this.height = 45,
      this.color = AppColors.primary,
      this.width,
      this.padding = const EdgeInsets.symmetric(vertical: 18, horizontal: 10)});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(padding),
          backgroundColor: WidgetStateProperty.all<Color>(
              isEnabled ? color : color.withOpacity(0.4)),
          minimumSize:
              WidgetStateProperty.all(Size(width ?? context.width, height)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        onPressed: () => (!isEnabled || isLoading) ? null : onPressed(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge?.copyWith(color: textColor)),
            if (isLoading) ...{
              Container(
                height: 18,
                width: 18,
                margin: const EdgeInsets.only(left: 10),
                child: CircularProgressIndicator(
                  color: textColor,
                  strokeWidth: 2,
                ),
              )
            }
          ],
        ));
  }
}
