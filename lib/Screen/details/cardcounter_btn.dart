import 'package:flutter/material.dart';
import 'package:gerocaryapp/controller/home_controller.dart';

import '../../constance.dart';
import '../../models/product.dart';

import 'round_icons_btn.dart';

class CartCounter extends StatelessWidget {
  CartCounter({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF6F6F6),
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: Row(
        children: [
          RoundIconBtn(
            iconData: Icons.remove,
            color: Colors.black38,
            press: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 4),
            child: Text(
              "1",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
            ),
          ),
          RoundIconBtn(
            iconData: Icons.add,
            press: () {
              controller.incrementQuantity();
            },
          ),
        ],
      ),
    );
  }
}
