import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/size_manger.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, this.controller});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: const TextStyle(
          fontSize: SizeManager.s16,
          fontWeight: FontWeight.w400,
          color: ColorManager.grey1,
        ),
        filled: true,
        fillColor: ColorManager.white,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: SizeManager.s16, vertical: SizeManager.s12),
        // enabled border style
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorManager.grey.withOpacity(0.48),
              width: SizeManager.s1),
          borderRadius: BorderRadius.circular(SizeManager.s25),
        ),
        // focused border style
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: ColorManager.primaryOpacity, width: SizeManager.s1),
          borderRadius: BorderRadius.circular(SizeManager.s25),
        ),

        // error border style
        errorBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: ColorManager.grey, width: SizeManager.s1),
          borderRadius: BorderRadius.circular(SizeManager.s25),
        ),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: ColorManager.grey, width: SizeManager.s1),
          borderRadius: BorderRadius.circular(SizeManager.s25),
        ),
        suffixIcon: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(SizeManager.s25))),
            child: const Icon(
              Icons.search,
              color: ColorManager.white,
            )),
      ),
    );
  }
}
