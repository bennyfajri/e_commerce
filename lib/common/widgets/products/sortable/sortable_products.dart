import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layout/grid_product_layout.dart';
import '../product_cards/product_card_vertical.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration:
          const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: [
            "Name",
            "Higher Price",
            "Lower Price",
            "Sale",
            "Newews",
            "Popularity"
          ].map((e) => DropdownMenuItem(value: e,child: Text(e),)).toList(),
          onChanged: (value) {},
        ),
        const SizedBox(height: Sizes.spaceBetweenSections),

        /// Products
        GridProductLayout(itemCount: 8, itemBuilder: (_, index) => const ProductCardVertical())
      ],
    );
  }
}