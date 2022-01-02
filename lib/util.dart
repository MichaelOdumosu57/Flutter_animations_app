import 'package:flutter/material.dart';
import 'package:herodemo/radial.dart';

class Util {
  static const String COFFEE_URL =
      "https://images.pexels.com/photos/585750/pexels-photo-585750.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  static const String CAPPUCCINO_URL =
      "https://images.pexels.com/photos/10273551/pexels-photo-10273551.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  static const String TEA_URL =
      "https://images.pexels.com/photos/405238/pexels-photo-405238.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";

  static Widget buildHeroRadialIcon(
      String path, String tag, double minRadius, double maxRadius) {
    return Container(
        child: Hero(
      tag: tag,
      createRectTween: _createTween,
      child: Container(
        height: minRadius,
        width: minRadius,
        child: RadialTransition(
            maxRadius,
            Image.network(
              path,
              fit: BoxFit.cover,
            )),
      ),
    ));
  }

  static Widget buildHeroRadialDestination(String path, String tag,
      double maxWidth, double maxHeight, VoidCallback pop) {
    return GestureDetector(
      onTap:pop,
      child: Hero(
        createRectTween: _createTween,
        tag: tag,
        child: Container(
          height: maxHeight,
          width: maxWidth,
          child: RadialTransition(
              maxWidth / 2, Image.network(path, fit: BoxFit.cover)),
        ),
      ),
    );
  }

  static Widget buildHeroDestination(String path, String tag, double width) {
    return Hero(
      tag: tag,
      child: Container(
          width: width,
          child: Image.network(
            path,
            fit: BoxFit.cover,
          )),
    );
  }

  static Widget buildHeroIcon(String path, String tag) {
    return Hero(
      tag: tag,
      child: Container(
          width: 80, height: 80, child: Image.network(path, fit: BoxFit.cover)),
    );
  }

  static Tween<Rect?> _createTween(Rect? begin, Rect? end) {
    return MaterialRectArcTween(begin: begin, end: end);
  }
}
