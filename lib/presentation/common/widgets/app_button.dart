import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/size_manger.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      this.isPrimary = true,
      required this.onPressed,
      required this.text});
  final bool isPrimary;
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: SizeManager.s49,
        child: ElevatedButton(
          onPressed: onPressed,
          style: isPrimary
              ? null
              : Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  backgroundColor:
                      MaterialStateProperty.all(ColorManager.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          SizeManager.s21,
                        ),
                        side: const BorderSide(color: ColorManager.primary)),
                  )),
          child: Text(
            text,
            style:
                isPrimary ? null : const TextStyle(color: ColorManager.primary),
          ),
        ));
  }
}
