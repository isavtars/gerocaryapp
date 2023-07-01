import 'package:flutter/material.dart';
import 'package:gerocaryapp/constance.dart';
import 'package:gerocaryapp/models/product.dart';

import '../widgets/fav_icons.dart';
import '../widgets/pricws.dart';
import 'cardcounter_btn.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(
      {super.key, required this.product, required this.onProductAdd});
  final Product product;
  final VoidCallback onProductAdd;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String _cartTag = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: aappbar(),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: ElevatedButton(
              onPressed: () {
                widget.onProductAdd();
                setState(() {
                  _cartTag = '_cartTag';
                });
                Navigator.pop(context);
              },
              child: const Text("Add to Cart"),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.98,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  color: const Color(0xFFF8F8F8),
                  child: Hero(
                    tag: widget.product.titleName + _cartTag,
                    child: Image.asset(widget.product.images),
                  ),
                ),
                Positioned(
                  bottom: -20,
                  child: CartCounter(
                    product: widget.product,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: defaultPadding * 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.product.titleName,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Price(amount: widget.product.prices),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Text(
              "Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the cole crops or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).",
              style: TextStyle(
                color: Color(0xFFBDBDBD),
                height: 1.8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar aappbar() {
    return AppBar(
      leading: const BackButton(
        color: Colors.black,
      ),
      backgroundColor: const Color(0xFFF8F8F8),
      elevation: 0,
      centerTitle: true,
      title: const Text(
        "Fruits",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        const FavBtn(radius: 20),
        const SizedBox(width: defaultPadding),
      ],
    );
  }
}
