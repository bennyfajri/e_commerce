import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          title: "Shipping Address",
          buttonTitle: "Change",
          onPressed: () {},
        ),
        Text(
          "Muhammad Beni Fajri",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: Sizes.spaceBetweenItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: Sizes.spaceBetweenItems),
            Text("01234565689", style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: Sizes.spaceBetweenItems / 2),

        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: Sizes.spaceBetweenItems),
            Text(
              "Lorem Ipsum sit amet dolor",
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            )
          ],
        ),
      ],
    );
  }
}
