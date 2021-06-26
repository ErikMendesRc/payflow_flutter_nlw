import 'package:boletos/shared/themes/app_colors.dart';
import 'package:boletos/shared/themes/app_text_style.dart';
import 'package:boletos/shared/widgets/set_label_buttons/set_label_buttons.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondLabel;
  final VoidCallback secondOnPressed;
  final String title;
  final String subTitle;
  const BottomSheetWidget(
      {Key? key,
      required this.primaryLabel,
      required this.primaryOnPressed,
      required this.secondLabel,
      required this.secondOnPressed,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text.rich(
                        TextSpan(
                            text: title,
                            style: TextStyles.buttonBoldHeading,
                            children: [
                              TextSpan(
                                  text: "\n$subTitle",
                                  style: TextStyles.buttonHeading),
                            ]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 1,
                          color: AppColors.stroke,
                        )
                      ],
                    ),
                    SetLabelButtons(
                        enablePrimaryColor: true,
                        primaryLabel: primaryLabel,
                        primaryOnPressed: primaryOnPressed,
                        secondLabel: secondLabel,
                        secondOnPressed: secondOnPressed)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
