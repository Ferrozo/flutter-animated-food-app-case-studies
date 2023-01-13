import 'package:flutter/material.dart';
import 'package:animated_food_app/src/views/widgets/export_widget.dart';

import '../../../models/dish/dish_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.6);
  int _currentPage = 0;
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
      name: 'Lemon-Garlic',
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
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
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
            aspectRatio: 1.2,
            child: PageView.builder(
              controller: _pageController,
              // physics: const ClampingScrollPhysics(),
              itemCount: dishList.length,
              itemBuilder: (_, currentIndex) {
                bool activePage = currentIndex == _currentPage;
                return DishCard(
                  isActive: activePage,
                  dishInfo: dishList[currentIndex],
                );
              },
            ),
          ),
          DishInfo(
              dishTitle: dishList[_currentPage].name,
              dishPrice: dishList[_currentPage].price),
        ],
      ),
    );
  }
}
