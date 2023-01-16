class DishModel {
  DishModel({required this.name, required this.img, required this.price});
  final String name;
  final String img;
  final double price;
}

class DishList {
  static List<DishModel> dishList = [
    DishModel(
      name: 'Skillet Chicken',
      img: 'src/assets/01.png',
      price: 3.99,
    ),
    DishModel(
      name: 'Ramen',
      img: 'src/assets/09.png',
      price: 5.0,
    ),
    DishModel(
      name: 'One-Pot Super ',
      img: 'src/assets/02.png',
      price: 4.59,
    ),
    DishModel(
      name: 'Chow Mein',
      img: 'src/assets/08.png',
      price: 5.0,
    ),
    DishModel(
      name: 'Mexican Tortilla ',
      img: 'src/assets/03.png',
      price: 2.39,
    ),
    DishModel(
      name: 'Sashimi',
      img: 'src/assets/10.png',
      price: 5.0,
    ),
    DishModel(
      name: 'Lemon-Garlic',
      img: 'src/assets/04.png',
      price: 4.89,
    ),
    DishModel(
      name: 'Biryani',
      img: 'src/assets/07.png',
      price: 5.0,
    ),
  ];
}
