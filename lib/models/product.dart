class Product {
  final String images;
  final String titleName;
  final String prices;

  Product(
      {required this.images, required this.titleName, required this.prices});
}

List<Product> demoproducts = [
  Product(
      images: "assets/images/img_1.png", titleName: "Cabbage", prices: "30.0"),
  Product(
      images: "assets/images/img_2.png", titleName: "carrot", prices: "20.0"),
  Product(
      images: "assets/images/img_3.png",
      titleName: "Bettergurd",
      prices: "50.0"),
  Product(
      titleName: "Brinjial", images: "assets/images/img_3.png", prices: "60"),
  Product(
      titleName: "Pakcoyr", images: "assets/images/img_4.png", prices: '50'),
  Product(
      titleName: "Cucumber", images: "assets/images/img_1.png", prices: '50'),
];
