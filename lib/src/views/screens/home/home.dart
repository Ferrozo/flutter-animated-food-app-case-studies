import 'package:flutter/material.dart';
import 'package:animated_food_app/src/views/widgets/export_widget.dart';
import 'package:animated_food_app/src/views/screens/export_screens.dart';

import '../../../models/dish/dish_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final PageController _pageController = PageController(viewportFraction: 0.6);
  late AnimationController _rotationController;
  int _currentPage = 0;
  final List<DishModel> dishList = [
    DishModel(
      name: 'Skillet Chicken',
      img: 'src/assets/01.png',
      price: 3.99,
    ),
    DishModel(
      name: 'One-Pot Super ',
      img: 'src/assets/02.png',
      price: 4.59,
    ),
    DishModel(
      name: 'Mexican Tortilla ',
      img: 'src/assets/03.png',
      price: 2.39,
    ),
    DishModel(
      name: 'Lemon-Garlic',
      img: 'src/assets/04.png',
      price: 4.89,
    ),
    DishModel(
      name: 'Grilled Chicken',
      img: 'src/assets/05.png',
      price: 5.0,
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
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      body: Column(
        children: <Widget>[
          const MainAppBar(),
          const SizedBox(height: 40),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 18,
                  top: -20,
                  child: RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: _rotationController,
                        curve: Curves.easeOutCirc)),
                    child: Container(
                      height: 320,
                      width: 320,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'src/assets/leaf_circle.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 1,
                  child: PageView.builder(
                    controller: _pageController,
                    // physics: const ClampingScrollPhysics(),
                    onPageChanged: (_) {
                      setState(
                        () {
                          _rotationController.forward(from: 0.75);
                        },
                      );
                    },
                    itemCount: dishList.length,
                    itemBuilder: (_, currentIndex) {
                      bool activePage = currentIndex == _currentPage;
                      return Column(
                        children: [
                          const SizedBox(height: 30),
                          DishCard(
                            openDetails: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => DetailsPage(
                                    title: dishList[currentIndex].name,
                                    img: dishList[currentIndex].img,
                                    price: dishList[currentIndex].price,
                                  ),
                                ),
                              );
                            },
                            isActive: activePage,
                            dishInfo: dishList[currentIndex],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 40,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: DishInfo(
                        dishTitle: dishList[_currentPage].name,
                        dishPrice: dishList[_currentPage].price),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
