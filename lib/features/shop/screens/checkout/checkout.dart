import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/cart/coupon_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: MyAppBar(
        showBackArrow: true,
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              /// Items in Cart
              CartItems(
                showAddRemoveButtons: false,
              ),
              SizedBox(height: Sizes.spaceBetweenSections),

              /// Coupon TextField
              CouponCode(),
              const SizedBox(height: Sizes.spaceBetweenSections),

              /// Billing Section
              RoundedContainer(
                showBorder: true,
                backgroundColor: dark ? MyColors.black : MyColors.white,
                padding: const EdgeInsets.all(Sizes.md),
                child: const Column(
                  children: [
                    /// Pricing
                    BillingAmountSection(),
                    SizedBox(height: Sizes.spaceBetweenItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: Sizes.spaceBetweenItems),

                    /// Payment Methods
                    BillingPaymentSection(),
                    SizedBox(height: Sizes.spaceBetweenItems),

                    /// Address
                    BillingAddressSection(),

                    /// Billing Address Section
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: Images.successfulPaymentIcon,
              title: "Payment Success",
              subTitle: "Your will be shipped soon!",
              onPressed: () => Get.offAll(()=> const NavigationMenu()),
            ),
          ),
          child: const Text("Checkout \$256"),
        ),
      ),
    );
  }
}
