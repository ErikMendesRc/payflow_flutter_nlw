import 'package:boletos/shared/themes/app_colors.dart';
import 'package:boletos/shared/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle? style;
  const LabelButton(
      {Key? key, required this.label, required this.onPressed, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.shape,
      height: 56,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: style ?? TextStyles.buttonHeading,
        ),
      ),
    );
  }
}
