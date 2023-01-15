import 'package:animated_food_app/src/models/dish/dish_model.dart';
import 'package:flutter/material.dart';

class DishCard extends StatelessWidget {
  const DishCard({
    Key? key,
    required this.dishInfo,
    required this.isActive,
    required this.openDetails,
  }) : super(key: key);

  final DishModel dishInfo;
  final bool isActive;
  final Function openDetails;

  @override
  Widget build(BuildContext context) {
    final double width = isActive ? 215.0 : 120;
    final double height = isActive ? 215.0 : 120;
    final double dishSize = isActive ? 170.0 : 100;
    return Column(
      children: <Widget>[
        Transform.translate(
          offset: Offset(0, isActive ? 0 : 180),
          child: AnimatedContainer(
            curve: const Interval(0.0, 1.0, curve: Curves.easeInOutQuad),
            duration: const Duration(microseconds: 500),
            alignment: Alignment.center,
            width: width,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: const DecorationImage(
                  image: AssetImage('src/assets/board_dish.png'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                      color: const Color.fromARGB(5, 35, 35, 35),
                      offset:
                          isActive ? const Offset(-1, 10) : const Offset(0, 0)),
                ]),
            child: InkWell(
              onTap: () {
                openDetails();
              },
              child: Image.asset(
                dishInfo.img,
                width: dishSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
