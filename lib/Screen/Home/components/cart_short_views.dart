import 'package:flutter/material.dart';

import '../../../constance.dart';
import '../../../controller/home_controller.dart';
import '../../../models/product.dart';
import '../../details/details_screen.dart';

class CardShortView extends StatelessWidget {
  const CardShortView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;
  final String _cartTag = "_cartTag";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Cart",
          style: Theme.of(context).textTheme.headline6,
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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 500),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 500),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  FadeTransition(
                            opacity: animation,
                            child: DetailsScreen(
                              product: demoproducts[index],
                              onProductAdd: () {},
                            ),
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag:
                          "${controller.cart[index].product!.titleName} $_cartTag",
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage(controller.cart[index].product!.images),
                      ),
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
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: primaryColor),
          ),
        )
      ],
    );
  }
}
