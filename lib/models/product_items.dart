import 'package:gerocaryapp/models/product.dart';

class ProductItems {
  //Cart box

  int quintity;
  final Product? product;
  ProductItems({this.quintity = 1, required this.product});

//get quintity
  int get totalqun => quintity;

  void  increment() {
    // totalqun=quintity++;
  }

  void add() {
    quintity++;
  }

  void sub() {
    if (quintity < 1) {
      quintity--;
    }
  }
}
