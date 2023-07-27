import 'package:flutter/material.dart';
import 'package:walkzero/src/presentation/views/dashboard.dart';
import 'package:walkzero/src/presentation/widgets/resuable_button.dart';
import 'package:walkzero/src/presentation/widgets/resuable_text_field.dart';
import 'package:walkzero/src/utils/constants/constants.dart';

import '../../config/router/bottom_nav.dart';
import '../../utils/extentions/validator.dart';
import '../widgets/bezierContainer.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  bool passToggle = true;
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left,
                  color: Colors.black, size: 25),
            ),
            Text('Back',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xfffbb448), Color(0xfff7892b)])),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Email id"),
        _entryField("Password", isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: height,
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: -height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height / 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Login to Walkzero',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // _title(),
                      SizedBox(height: height / 25),
                      textInput(
                          hint: 'Email',
                          icon: Icons.email,
                          validator: (text) => validateEmail(text)),
                      // CommonTextField(
                      //     //   controller: state.emailController,
                      //     hintText: ' Email',
                      //     prefixIcon: Icon(Icons.email),
                      //     inputAction: TextInputAction.next,
                      //     validator: (text) => validateEmail(text)),
                      SizedBox(
                        height: height / 20,
                      ),
                      textInput(
                          hint: 'password',
                          icon: Icons.vpn_key,
                          ispassword: passToggle ? true : false,
                          suficon: passToggle
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          validator: (text) => validatePassword(text)),
                      //   _emailPasswordWidget(),
                      SizedBox(height: height / 25),

                      Row(
                        children: [
                          Container(
                            //alignment: Alignment(1, 0),
                            child: Checkbox(
                              checkColor: Colors.white,
                              side: const BorderSide(
                                // set border color here
                                color: Colors.grey,
                              ),
                              fillColor: MaterialStateProperty.resolveWith(
                                  (states) => Color(0xFFf45600)),
                              value: isChecked,
                              onChanged: (value) {
                                isChecked = !isChecked;
                                setState(() {
                                  //     // login();
                                });
                              },
                              // value: null,
                            ),
                          ),
                          // Container(
                          //   alignment: Alignment(1, 0),
                          const Text(
                            'Remember me',
                            //textAlign: left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: Width / 6),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              child: Text(
                                'Forgot Password ?',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: wzprimary),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      resuableButton(context, 'Continue', BottomNav()),
                      // _divider(),
                      // _facebookButton(),
                      SizedBox(height: height * .055),
                      _createAccountLabel(),
                    ],
                  ),
                ),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
              Positioned(
                bottom: -height * .20,
                left: -MediaQuery.of(context).size.width * .4,
                // left: -Width / 3,
                // bottom: -height / 4,
                child: Transform.rotate(
                    angle: 3.2,

                    // decoration: BoxDecoration(
                    //   gradient: LinearGradient(
                    //     colors: [
                    //       Color(0xFFf45600),
                    //       Color.fromARGB(255, 226, 147, 67)
                    //     ], // Customize your gradient colors here
                    //     begin: Alignment.topCenter,
                    //     end: Alignment.bottomCenter,
                    //   ),
                    //   // shape: BoxShape.circle,
                    // ),
                    child: BezierContainer()
                    // CircleAvatar(
                    //   backgroundColor: Colors.transparent,
                    //   radius: 100, // Adjust the radius to your desired value
                    // ),

                    ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
