import 'package:flutter/material.dart';
import 'package:gerocaryapp/constance.dart';

import '../../../controller/home_controller.dart';
import 'cart_details_view_card.dart';

class CartDetailsView extends StatelessWidget {
  const CartDetailsView({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Cart", style: Theme.of(context).textTheme.headline6),
          ...List.generate(
            controller.cart.length,
            (index) => CartDetailsViewCard(productItem: controller.cart[index],isndex: index,),
          ),
          const SizedBox(height: defaultPadding),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Total Pricess"),
                Spacer(),
                Text("${controller.getTotalPrice().toString()}"),
              ],
            ),
          ),
          const SizedBox(height: defaultPadding),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Next"),
            ),
          )
        ],
      ),
    );
  }
}
