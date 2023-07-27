import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:walkzero/src/presentation/views/dashboard.dart';
import 'package:walkzero/src/presentation/views/inbox.dart';
import 'package:walkzero/src/presentation/views/me_screen.dart';
import 'package:walkzero/src/presentation/views/more_screen.dart';
import 'package:walkzero/src/presentation/views/my_team.dart';

import '../../presentation/cubits/bottomnavcubit_cubit.dart';
import '../../presentation/cubits/singleselect.dart';
import '../../utils/constants/constants.dart';

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      child: BottomNavDesign(),
      providers: [
        BlocProvider(create: (context) => BottomnavcubitCubit()),
        BlocProvider(create: (context) => singleselect())
      ],
    );
  }
}

class BottomNavDesign extends StatefulWidget {
  @override
  _BottomNavDesignState createState() => _BottomNavDesignState();
}

class _BottomNavDesignState extends State<BottomNavDesign> {
  /// Create a list of pages to make the code shorter and better readability
  ///
  final _pageNavigation = [
    LandingScreen(),
    InboxScreen(),
    MeScreen(),
    MyTeamScreen(),
    MoreScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomnavcubitCubit, int>(builder: (context, state) {
      return Scaffold(
        body: _buildBody(state),
        bottomNavigationBar: _buildBottomNav(),
      );
    });
  }

  Widget _buildBody(int index) {
    /// Check if index is in range
    /// else return Not Found widget
    ///
    return _pageNavigation.elementAt(index);
  }

  Widget _buildBottomNav() {
    final height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    // bottomNavigationBar: ClipRRect(
    //   borderRadius: BorderRadius.only(
    //     topLeft: Radius.circular(10),
    //     topRight: Radius.circular(10),
    //   ),
    //   child: Container(
    //     // height: 62,
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: height / 12,
        width: Width / 25,
        // color: Colors.white,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.all(Radius.circular(125)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey
                  .withOpacity(0.3), // Customize the shadow color here
              spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(0, 2), // Customize the shadow offset here
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Color.fromARGB(255, 248, 244, 244),
        ),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.all(Radius.circular(125)),
        //   // borderRadius: BorderRadius.only(
        //   //     topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        // ),
        //color: white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
          child: GNav(
            onTabChange: _getChangeBottomNav,
            backgroundColor: Colors.transparent,
            color: wzprimary,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade700,
            gap: 8,
            padding: EdgeInsets.all(12),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                iconSize: 25,
              ),
              GButton(
                icon: Icons.inbox,
                text: 'Inbox',
                iconSize: 25,
              ),
              GButton(
                icon: Icons.perm_identity_outlined,
                text: 'Me',
                iconSize: 25,
              ),
              GButton(
                icon: Icons.people,
                text: 'Team',
                iconSize: 25,
              ),
              GButton(
                icon: Icons.more_horiz_outlined,
                text: 'More',
                iconSize: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _getChangeBottomNav(int index) {
    context.read<BottomnavcubitCubit>().updateIndex(index);
  }
}
