import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DishInfo extends StatelessWidget {
  const DishInfo({
    Key? key,
    required this.dishTitle,
    required this.dishPrice,
  }) : super(key: key);

  final String dishTitle;
  final double dishPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 30),
        Text(
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          dishTitle,
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
              Container(
                margin: EdgeInsets.only(left: i != 0 ? 8 : 0),
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: i != 4 ? Colors.orange : Colors.grey,
                ),
              ),
          ],
        ),
        const SizedBox(height: 15),
        Text(
          '\$$dishPrice',
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
                FontAwesomeIcons.bellConcierge,
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
