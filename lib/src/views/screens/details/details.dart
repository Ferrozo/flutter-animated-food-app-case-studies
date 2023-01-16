import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage(
      {Key? key, required this.title, required this.img, required this.price})
      : super(key: key);
  final String title;
  final String img;
  final double price;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  bool activeComplementaryIgred = false;
  bool activeMiddleIgred = false;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    super.initState();
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Column(
              children: const <Widget>[
                Text(
                  'Location',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Luanda, Angola 🇦🇴',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartShopping,
                color: Colors.orange,
              ),
            ),
          ],
        ),
        leading: const BackButton(
          color: Colors.orange,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 40,
                  child: Container(
                    alignment: Alignment.center,
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                        image: AssetImage('src/assets/board_dish.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: RotationTransition(
                        turns: Tween(begin: 0.0, end: 0.2).animate(
                            CurvedAnimation(
                                parent: _animationController,
                                curve: Curves.decelerate)),
                        child: Image.asset(
                          widget.img,
                          width: 200,
                        )),
                  ),
                ),
                AnimatedPositioned(
                  left: 140,
                  curve: Curves.decelerate,
                  top: 100,
                  duration: const Duration(milliseconds: 500),
                  child: Transform.scale(
                    scale: activeMiddleIgred ? 1 : 100,
                    child: Container(
                      color: activeMiddleIgred
                          ? Colors.yellow
                          : Colors.transparent,
                      width: 80,
                      height: 80,
                      child: Image.asset('src/assets/leaf_circle.png'),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          widget.title,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 95, 31, 12),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          '\$${widget.price}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 95, 34, 12),
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 1; i <= 2; i++)
                              InkWell(
                                onTap: i == 1
                                    ? () {
                                        setState(() {
                                          activeMiddleIgred =
                                              !activeMiddleIgred;
                                        });
                                      }
                                    : () {
                                        setState(() {
                                          activeComplementaryIgred =
                                              !activeComplementaryIgred;
                                        });
                                      },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  margin:
                                      EdgeInsets.only(left: i == 1 ? 0 : 10),
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    'src/assets/complem_$i.png',
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 30),
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
                                FontAwesomeIcons.bellConcierge,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                AnimatedPositioned(
                  right: activeComplementaryIgred ? 65 : -100,
                  curve: Curves.easeIn,
                  top: 8,
                  duration: const Duration(milliseconds: 500),
                  child: SizedBox(
                    width: 65,
                    height: 65,
                    child: Image.asset('src/assets/complem_2.png'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
