import 'package:flutter/material.dart';
import 'package:grocery_app/controllers/home_controller.dart';

import '../../../constants.dart';

class CardShortView extends StatelessWidget {
  const CardShortView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Cart",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(width: defaultPadding),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                controller.cart.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: defaultPadding / 2),
                  child: Hero(
                    // ignore: prefer_interpolation_to_compose_strings
                    tag: controller.cart[index].product!.title! + "_cartTag",
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage(controller.cart[index].product!.image!),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            controller.totalCartItems().toString(),
            // ignore: prefer_const_constructors
            style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
          ),
        )
      ],
    );
  }
}
