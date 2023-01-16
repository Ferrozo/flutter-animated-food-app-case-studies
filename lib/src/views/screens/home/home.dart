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
                  left: 19,
                  top: -22,
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
                    itemCount: DishList.dishList.length,
                    itemBuilder: (_, currentIndex) {
                      bool activePage = currentIndex == _currentPage;
                      return Column(
                        children: [
                          const SizedBox(height: 35),
                          DishCard(
                            openDetails: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => DetailsPage(
                                    title: DishList.dishList[currentIndex].name,
                                    img: DishList.dishList[currentIndex].img,
                                    price:
                                        DishList.dishList[currentIndex].price,
                                  ),
                                ),
                              );
                            },
                            isActive: activePage,
                            dishInfo: DishList.dishList[currentIndex],
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
                        dishTitle: DishList.dishList[_currentPage].name,
                        dishPrice: DishList.dishList[_currentPage].price),
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
