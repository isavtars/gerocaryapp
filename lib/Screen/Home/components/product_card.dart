import 'package:flutter/material.dart';
import 'package:gerocaryapp/constance.dart';
import 'package:gerocaryapp/models/product.dart';

import '../../widgets/fav_icons.dart';
import '../../widgets/pricws.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.onpress});

  final Product product;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        decoration: const BoxDecoration(
            color: Color(0xFFF7F7F7),
            borderRadius:
                BorderRadius.all(Radius.circular(defaultPadding * 1.25))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Hero(tag: product.titleName, child: Image.asset(product.images)),
          Text(
            product.titleName,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            "Friuts",
            style: Theme.of(context).textTheme.caption,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Price(
                amount: product.prices,
              ),
              const FavBtn(),
            ],
          )
        ]),
      ),
    );
  }
}
