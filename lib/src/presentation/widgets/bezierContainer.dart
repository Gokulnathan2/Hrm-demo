import 'dart:math';

import 'package:flutter/material.dart';

import 'login_custom_clipper.dart';

class BezierContainer extends StatelessWidget {
  const BezierContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Transform.rotate(
      angle: -pi / 3.5,
      child: ClipPath(
        clipper: ClipPainter(),
        child: Container(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey
                      .withOpacity(0.3), // Customize the shadow color here
                  spreadRadius: 4,
                  blurRadius: 4,
                  offset: Offset(0, 2), // Customize the shadow offset here
                ),
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFf45600).withOpacity(1),
                    Color.fromARGB(255, 226, 147, 67).withOpacity(0.7)
                  ])),
        ),
      ),
    ));
  }
}
