import 'package:flutter/material.dart';
import 'package:gerocaryapp/controller/home_controller.dart';

import '../../constance.dart';

import '../../models/product.dart';
import '../details/details_screen.dart';

import 'components/cart_showing_screen.dart';
import 'components/cart_short_views.dart';
import 'components/home_header.dart';
import 'components/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();

  void _onVerticalGesture(DragUpdateDetails details) {
    // debugPrint("${details.primaryDelta}");
    if (details.primaryDelta! < -0.7) {
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      controller.changeHomeState(HomeState.normal);
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: SafeArea(
          // bottom: false,
          child: Container(
            color: const Color(0xFFEAEAEA),
            child: AnimatedBuilder(
                animation: controller,
                builder: (context, _) {
                  return LayoutBuilder(
                    builder: (context, BoxConstraints constraints) {
                      return Stack(
                        children: [
                          //header
                          AnimatedPositioned(
                            duration: panelTransition,
                            left: 0,
                            right: 0,
                            top: controller.homeState == HomeState.normal
                                ? 0
                                : -headerHeight,
                            height: headerHeight,
                            child: const HomeHeader(),
                          ),
                          //card Gridsitem
                          AnimatedPositioned(
                            duration: panelTransition,
                            top: controller.homeState == HomeState.normal
                                ? headerHeight
                                : -(constraints.maxHeight -
                                    cartBarHeight * 2 -
                                    headerHeight),
                            left: 0,
                            right: 0,
                            height: constraints.maxHeight -
                                headerHeight -
                                cartBarHeight,
                            child: Container(
                              height: constraints.maxHeight - headerHeight,
                              padding: const EdgeInsets.all(defaultPadding),
                              child: GridView.builder(
                                  itemCount: demoproducts.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: defaultPadding,
                                          crossAxisSpacing: defaultPadding,
                                          childAspectRatio: 0.75,
                                          crossAxisCount: 2),
                                  itemBuilder: (context, index) {
                                    return ProductCard(
                                      product: demoproducts[index],
                                      onpress: () {
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            transitionDuration: const Duration(
                                                milliseconds: 500),
                                            reverseTransitionDuration:
                                                const Duration(
                                                    milliseconds: 500),
                                            pageBuilder: (context, animation,
                                                    secondaryAnimation) =>
                                                FadeTransition(
                                              opacity: animation,
                                              child: DetailsScreen(
                                                product: demoproducts[index],
                                                onProductAdd: () {
                                                  controller.addProductToCart(
                                                      demoproducts[index]);
                                                  debugPrint(
                                                      "scart add sucess");
                                                },
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }),
                            ),
                          ),
                          // Card Panel
                          AnimatedPositioned(
                            duration: panelTransition,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            height: controller.homeState == HomeState.normal
                                ? cartBarHeight
                                : (constraints.maxHeight - cartBarHeight),
                            child: GestureDetector(
                              onVerticalDragUpdate: _onVerticalGesture,
                              
                              child: Container(
                                padding: const EdgeInsets.all(defaultPadding),
                                color: const Color(0xFFEAEAEA),
                                alignment: Alignment.topLeft,
                                child: AnimatedSwitcher(
                                  duration: panelTransition,
                                  child: controller.homeState ==
                                          HomeState.normal
                                      ? CardShortView(controller: controller)
                                      : CartDetailsView(controller: controller),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }),
          ),
        ));
  }
}
