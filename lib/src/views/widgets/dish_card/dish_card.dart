import 'package:animated_food_app/src/models/dish/dish_model.dart';
import 'package:flutter/material.dart';

class DishCard extends StatelessWidget {
  const DishCard({
    Key? key,
    required this.dishInfo,
  }) : super(key: key);

  final DishModel dishInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: 250,
          height: 250,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('src/assets/board_dish.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Image.asset(
            dishInfo.img,
            width: 200,
          ),
        ),
        const SizedBox(height: 50),
        Text(
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          dishInfo.name,
          style: const TextStyle(
            fontSize: 25,
            color: Color.fromARGB(255, 95, 34, 12),
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i <= 4; i++)
              Icon(
                Icons.star,
                color: i != 4 ? Colors.orange : Colors.grey,
              ),
          ],
        ),
        const SizedBox(height: 15),
        Text(
          '\$${dishInfo.price}',
          style: const TextStyle(
            color: Color.fromARGB(255, 95, 34, 12),
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'S',
                style: TextStyle(
                  color: Color.fromARGB(255, 95, 34, 12),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'M',
                style: TextStyle(
                  color: Color.fromARGB(255, 95, 34, 12),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'L',
                style: TextStyle(
                  color: Color.fromARGB(255, 95, 34, 12),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 60,
            width: 60,
            child: IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }
}
