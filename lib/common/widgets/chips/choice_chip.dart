import 'package:e_commerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class MyChoiceChip extends StatelessWidget {
  const MyChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isTextNull = HelperFunctions.getColor(text) != null;

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
          label: isTextNull
              ? const SizedBox()
              : Text(text),
          selected: selected,
          onSelected: onSelected,
          labelStyle: TextStyle(color: selected ? MyColors.white : null),
          avatar: isTextNull
              ? CircularContainer(
              width: 50,
              height: 50,
              backgroudColor: HelperFunctions.getColor(text)!)
              : null,
          labelPadding: isTextNull ? const EdgeInsets.all(0) : null,
          padding: isTextNull ? const EdgeInsets.all(0) : null,
          shape: isTextNull ? const CircleBorder() : null,
          backgroundColor: isTextNull ? HelperFunctions.getColor(text)! : null
      ),
    );
  }
}
