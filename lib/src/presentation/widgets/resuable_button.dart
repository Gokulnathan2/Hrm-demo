import 'package:flutter/material.dart';

import '../../config/router/animated_route.dart';
import '../../utils/constants/constants.dart';

Widget resuableButton(BuildContext context, String name, Widget page) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  return SizedBox(
    width: screenWidth / 1.2,
    height: 45,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Color(0xFFf45600),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
        onPressed: () {
          Navigator.push(context, RightSlideTransitionPageRoute(page: page));
        },
        child: Text(
          name,
          style: TextStyle(color: Colors.white),
        )),
  );
}

class CommonButton extends StatelessWidget {
  final String? label;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onPressed;
  final double textSize;
  final Color labelColor;
  final Color bgColor;
  final Widget? child;

  const CommonButton({
    required this.onPressed,
    this.label,
    this.child,
    this.padding = const EdgeInsets.all(16),
    this.textSize = 18.0,
    this.labelColor = white,
    this.bgColor = wzsecondary,
    Key? key,
  })  : assert(child == null || label == null, "cannot assign both at once."),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          clipBehavior: Clip.hardEdge,
          style: ButtonStyle(padding: MaterialStateProperty.all(padding))
              .copyWith(backgroundColor: MaterialStateProperty.all(bgColor)),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
