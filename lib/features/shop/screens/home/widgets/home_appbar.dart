import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Texts.homeAppBarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.apply(color: MyColors.grey),
          ),
          Text(
            Texts.homeAppBarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.apply(color: Colors.white),
          ),
        ],
      ),
      actions: [
        CardCounterIcon(
          onPressed: () {},
          iconColor: MyColors.white,
        )
      ],
    );
  }
}