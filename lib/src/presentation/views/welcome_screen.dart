import 'package:flutter/material.dart';
import 'package:walkzero/src/presentation/views/pre_login_screen.dart';
import 'package:walkzero/src/utils/constants/constants.dart';
import 'package:walkzero/src/presentation/views/login_screen.dart';
import 'package:walkzero/src/presentation/widgets/resuable_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(children: [
        Stack(
          children: [
            ClipPath(
              clipper: ArcClipper(),
              child: Container(
                  width: screenWidth,
                  height: screenHeight / 2.3,
                  //  color: Color(0xFFf45600),

                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(
                              0.3), // Customize the shadow color here
                          spreadRadius: 4,
                          blurRadius: 4,
                          offset:
                              Offset(0, 2), // Customize the shadow offset here
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      gradient:
                          LinearGradient(begin: Alignment.topLeft, colors: [
                        wzsecondary,
                        // Color.fromARGB(255, 240, 226, 206),
                        Color.fromARGB(255, 226, 147, 67),
                      ]))),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment(0, 1.2),
                child: Container(
                  height: 90.0,
                  width: 90.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: new DecorationImage(
                      image: new AssetImage("assets/walkzero_logo.png"),
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 5.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: screenHeight / 20,
        ),
        Container(
          padding: const EdgeInsets.only(top: 32.0),
          child: Column(
            children: <Widget>[
              Text(
                'Welcome to Walkzero',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 22.0, left: 42.0, right: 42.0),
                child: Center(
                    child: Text(
                  'Single door solution for your organisation!',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                )),
              ),
              SizedBox(
                height: screenHeight / 5,
              ),
              resuableButton(context, 'Login', PreLoginScreen()),
              SizedBox(
                height: screenHeight / 50,
              ),
              SizedBox(
                width: screenWidth / 1.3,
                child: Text(
                  'By continuing, you agree to our Terms of Service and Privacy Policy',
                  style: TextStyle(color: Color.fromARGB(255, 82, 80, 80)),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 80);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - (size.width / 4),
      size.height,
      size.width,
      size.height - 80,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
