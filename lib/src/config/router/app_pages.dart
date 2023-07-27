
// import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
// import 'package:get/get.dart';

// import 'app_routes.dart';

// class AppPages {
//   static final List<GetPage> pages = [
//     GetPage(
//       name: AppRoutes.splash,
//       transition: Transition.fade,
//       transitionDuration: const Duration(milliseconds: 1),
//       page: () => SplashScreen(),
//     ),
//     GetPage(
//       name: AppRoutes.story,
//       transition: Transition.fade,
//       transitionDuration: const Duration(milliseconds: 1),
//        page: () => StoryViewScreen(Value: '',),
//       //page: () => StoryViewScreen(Value: '',)
//     ),
//     GetPage(
//       name: AppRoutes.login,
//       transitionDuration: const Duration(milliseconds: 1),
//       transition: Transition.fade,
//       page: () => BlocProvider<SigninCubit>(
//         create: (context) => SigninCubit(
//           authRepository: context.read<AuthRepository>(),
//         ),
//        child: Login(),
//       // child:StoryViews()
//       ),
//     ),
//     GetPage(
//       name: AppRoutes.landingScreen,
//       transition: Transition.fade,
//       transitionDuration: const Duration(milliseconds: 1),
//       //page: () => Landing(),
//       page:(() => MyApp()
//     ),
//     )
//   ];
// }
