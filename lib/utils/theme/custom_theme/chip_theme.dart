import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DChipTheme {
  DChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: MyColors.black),
    selectedColor: MyColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: MyColors.white
  );
  static ChipThemeData darkChipTheme =  const ChipThemeData(
      disabledColor: MyColors.darkerGrey,
      labelStyle: TextStyle(color: MyColors.white),
      selectedColor: MyColors.primary,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      checkmarkColor: Colors.white
  );
}