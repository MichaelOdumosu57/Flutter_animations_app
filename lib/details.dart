import 'package:flutter/material.dart';
import 'util.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class Details extends StatelessWidget {
  late String drinkPath;
  late String drinkTag;

  Details(this.drinkPath, this.drinkTag);

  @override
  Widget build(BuildContext context) {
    timeDilation = 6;
    pop() {
      Navigator.of(context).pop();
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      body: Center(
        child: Util.buildHeroRadialDestination(
            drinkPath, drinkTag, width, height, pop),
      ),
    );
  }
}
