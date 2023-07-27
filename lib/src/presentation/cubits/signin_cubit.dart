import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:walkzero/src/data/datasources/local/local_storage.dart';
import 'package:walkzero/src/presentation/views/post_login_screen.dart';
import 'package:walkzero/src/utils/constants/constants.dart';

import '../../domain/models/custom_error.dart';
import '../../domain/repositories/auth_repository.dart';
import '../views/dashboard.dart';
import '../widgets/error_dialog.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  // SigninCubit(super.initialState);

  final AuthRepository authRepository;
  SigninCubit({required this.authRepository}) : super(SigninState.initial());

  Future<void> prelogin({
    required BuildContext context,
    required String email,
  }) async {
    try {
      var response = await authRepository.prelogin(email: email);
      if (response['data'] != null) {
        print('proceed to password screen');
        var acountUrl = response['data']['preLogin']['domains'][0]['url'];
        var accountid = response['data']['preLogin']['id'];
        print(accountid);

        LocalDb.storeid(accountid);

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => PostLoginScreen()));
        emit(state.copyWith(signinStatus: SigninStatus.success));
      } else if (response['errors'] != null) {
        errorDialog(context, response['errors'][0]['email'][0]);
      }
    } on CustomError catch (e) {
      print('dt');
      errorDialog(context, e.message);
      emit(
        state.copyWith(
          signinStatus: SigninStatus.error,
          error: e,
        ),
      );
    }
  }

  Future<void> postlogin({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(signinStatus: SigninStatus.submitting));

    try {
      var response =
          await authRepository.postlogin(email: email, password: password);
      if (response['data'] != null) {
        print('proceed to dashboard screen');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LandingScreen()));
        emit(state.copyWith(signinStatus: SigninStatus.success));
      } else if (response['data'] == null && response['errors'] != null) {
        errorDialog(context, response['errors'][0]['error'][0].toString());
      } else if (response['errors'][0]['error'] == null) {
        errorDialog(context, response['errors'][0]);
      }
    } on CustomError catch (e) {
      print('dt');
      errorDialog(context, e.message);
      emit(
        state.copyWith(
          signinStatus: SigninStatus.error,
          error: e,
        ),
      );
    }
  }

  void onLogin(BuildContext context) async {
    if (state.formKey.currentState!.validate()) {
      print('client success');
      prelogin(
        context: context,
        email: state.emailController.text,
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: new Text("Alert!!"),
          content: new Text("Please Enter Valid Email Id!"),
          actions: <Widget>[
            new ElevatedButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  void onPostLogin(BuildContext context) async {
    if (state.formKey.currentState!.validate()) {
      print('pass client success');
      postlogin(
          context: context,
          email: state.emailController.text,
          password: state.passwordController.text);
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: new Text("Alert!!"),
          content: new Text("Please Enter Valid Password Id!"),
          actions: <Widget>[
            new ElevatedButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  void togleEye(bool isPasswordVisible) {
    emit(state.copyWith(ispasswordVisible: isPasswordVisible));
  }
}
