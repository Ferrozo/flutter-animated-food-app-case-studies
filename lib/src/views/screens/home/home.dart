import 'dart:math';

import 'package:flutter/material.dart';
import 'package:animated_food_app/src/views/widgets/export_widget.dart';

import '../../../models/dish/dish_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  final int _currentIndex = 0;
  final List<DishModel> dishList = [
    DishModel(
      name: 'Skillet Chicken',
      img: 'src/assets/01.png',
      price: 2.0,
    ),
    DishModel(
      name: 'One-Pot Super ',
      img: 'src/assets/02.png',
      price: 2.0,
    ),
    DishModel(
      name: 'Mexican Tortilla ',
      img: 'src/assets/03.png',
      price: 2.0,
    ),
    DishModel(
      name: 'Lemon-Garlic Skillet',
      img: 'src/assets/04.png',
      price: 2.0,
    ),
    DishModel(
      name: 'Grilled Chicken',
      img: 'src/assets/05.png',
      price: 2.0,
    ),
  ];
  @override
  void initState() {
    _pageController =
        PageController(initialPage: _currentIndex, viewportFraction: 0.7);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const MainAppBar(),
          const SizedBox(height: 40),
          AspectRatio(
            aspectRatio: 0.6,
            child: PageView.builder(
              controller: _pageController,
              physics: const ClampingScrollPhysics(),
              itemCount: dishList.length,
              itemBuilder: (context, index) {
                return dishScroll(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget dishScroll(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: ((context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0.2);
          value = (value * 0.02).clamp(-1, 1);
        }
        return Transform.translate(
          offset: index == _pageController.page
              ? const Offset(0, 0)
              : const Offset(-50, 10),
          child: Transform.scale(
            scale: index == _pageController.page ? 1 : 0.4,
            child: DishCard(
              dishInfo: dishList[index],
            ),
          ),
        );
      }),
    );
  }
}
