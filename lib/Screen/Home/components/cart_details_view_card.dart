import 'package:flutter/material.dart';

import '../../../constance.dart';

import '../../../models/product.dart';
import '../../../models/product_items.dart';
import '../../details/details_screen.dart';
import '../../widgets/pricws.dart';

class CartDetailsViewCard extends StatelessWidget {
  const CartDetailsViewCard(
      {Key? key, required this.productItem, required this.isndex})
      : super(key: key);

  final ProductItems productItem;
  final String _cartTag = "_cartTag";
  final int isndex;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              reverseTransitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  FadeTransition(
                opacity: animation,
                child: DetailsScreen(
                  product: demoproducts[isndex],
                  onProductAdd: () {},
                ),
              ),
            ),
          );
        },
        child: Hero(
          tag: "${productItem.product!.titleName} $_cartTag",
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(productItem.product!.images),
          ),
        ),
      ),
      title: Text(
        productItem.product!.titleName,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: FittedBox(
        child: Row(
          children: [
            Price(amount: productItem.product!.prices),
            Text(
              "  x ${productItem.quintity}",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
