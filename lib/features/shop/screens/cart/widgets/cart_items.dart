import 'package:flutter/cupertino.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: Sizes.spaceBetweenSections,
      ),
      itemCount: 2,
      itemBuilder: (_, index) {
        return Column(
          children: [
            const CartItem(),
            if (showAddRemoveButtons)
              const SizedBox(height: Sizes.spaceBetweenItems),
            if (showAddRemoveButtons)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      /// Extra Space
                      SizedBox(width: 70),

                      /// Add Remove Button
                      ProductQtyWithAddRemoveButton(),
                    ],
                  ),
                  ProductPriceText(price: "256")
                ],
              )
          ],
        );
      },
    );
  }
}
