import 'package:flutter/material.dart';
import 'package:herodemo/util.dart';

import 'details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero Animation',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HeroPage(),
    );
  }
}

class HeroPage extends StatelessWidget {
  const HeroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double maxRadius = MediaQuery.of(context).size.width / 2;
    final double minRadius = 80.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation'),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Util.buildHeroRadialIcon(
                  Util.COFFEE_URL, 'coffee', minRadius, maxRadius),
              onTap: () {
                changeRoute(context, 'coffee');
              },
            ),
            GestureDetector(
              child: Util.buildHeroRadialIcon(
                  Util.CAPPUCCINO_URL, 'cappuccino', minRadius, maxRadius),
              onTap: () {
                changeRoute(context, 'cappuccino');
              },
            ),
            GestureDetector(
              child: Util.buildHeroIcon(Util.TEA_URL, 'tea'),
              onTap: () {
                changeRoute(context, 'tea');
              },
            )
          ],
        ),
      ),
    );
  }

  void changeRoute(BuildContext context, String drink) {
    String drinkTag = drink;
    switch (drink) {
      case 'tea':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Details(Util.TEA_URL, drinkTag)));
        break;
      case 'cappuccino':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Details(Util.CAPPUCCINO_URL, drinkTag)));
        break;
      case 'coffee':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Details(Util.COFFEE_URL, drinkTag)));
        break;
    }
  }
}
