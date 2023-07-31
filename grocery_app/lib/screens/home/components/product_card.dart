import 'package:flutter/material.dart';
import 'package:grocery_app/components/fav_btn.dart';
import 'package:grocery_app/components/price.dart';
import 'package:grocery_app/models/Product.dart';

import '../../../constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  final Product product;

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        decoration: const BoxDecoration(
          color: Color(0xFFF7F7F7),
          borderRadius: BorderRadius.all(
            Radius.circular(defaultPadding * 1.25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: product.title!,
              child: Image.asset(product.image!),
            ),
            Text(
              product.title!,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              "Fruits",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            // ignore: prefer_const_constructors
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Price(amount: "20.00"),
                const FavBtn(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
