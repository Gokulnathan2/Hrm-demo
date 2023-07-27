import 'package:flutter/material.dart';
import 'package:walkzero/src/presentation/views/welcome_screen.dart';
import 'package:walkzero/src/presentation/widgets/drawer_screen.dart';

import '../../utils/constants/constants.dart';
import '../widgets/app_bar.dart';
import '../widgets/background_clipper.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return
        // SafeArea(

        Scaffold(
      // key: _scaffoldKey,
      // drawer: DrawerScreen(),
      // appBar: AppBar(
      //   leading: InkWell(
      //     onTap: () {
      //       _scaffoldKey.currentState?.openDrawer();
      //     },
      //     child: Icon(Icons.menu),
      //   ),
      //   toolbarHeight: 130,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   flexibleSpace: ClipPath(
      //     clipper: Customshape(),
      //     child: Container(
      //       height: 250,
      //       width: MediaQuery.of(context).size.width,
      //       decoration: BoxDecoration(
      //           gradient: LinearGradient(
      //               begin: Alignment.topCenter,
      //               end: Alignment.bottomCenter,
      //               colors: [
      //             Color.fromARGB(255, 226, 147, 67).withOpacity(0.7),
      //             Color(0xFFf45600).withOpacity(1),
      //           ])),
      //       // child: Center(
      //       //     child: Text(
      //       //   "Home",
      //       //   style: TextStyle(fontSize: 20, color: Colors.white),
      //       // )),
      //     ),
      //   ),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SliverSearchAppBar(),
            // Set this param so that it won't go off the screen when scrolling
            pinned: true,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (BuildContext context, int index) {
              return Column(
                children: [
                  Card(
                    shadowColor: Colors.orange,
                    color: Color.fromARGB(255, 255, 254, 254),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight / 40,
                        ),
                        Align(
                            alignment: Alignment(-0.8, 0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: screenWidth / 20,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  radius: 20,
                                  child: Center(
                                    child: Icon(Icons.cake,
                                        size: 30, color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth / 30,
                                ),
                                Text(
                                  'Upcoming Birthday',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                        Divider(
                          thickness: 1,
                        ),
                        Container(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
                            ),
                            title: Text('Navin '),
                            subtitle: Text('Birthday on Friday, july 28 '),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    shadowColor: Colors.orange,
                    color: Color.fromARGB(255, 255, 254, 254),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight / 40,
                        ),
                        Align(
                            alignment: Alignment(-0.8, 0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: screenWidth / 20,
                                ),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      Color.fromARGB(255, 224, 130, 6),
                                  child: Center(
                                    child: Icon(Icons.wine_bar_rounded,
                                        size: 30, color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth / 30,
                                ),
                                Text(
                                  'Work Anniversaries',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                        Divider(
                          thickness: 1,
                        ),
                        Container(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
                            ),
                            title: Text('Mathan '),
                            subtitle: Text('2nd Work anniversary tomorrow '),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    shadowColor: Colors.orange,
                    color: Color.fromARGB(255, 255, 254, 254),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight / 40,
                        ),
                        Align(
                            alignment: Alignment(-0.8, 0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: screenWidth / 20,
                                ),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      Color.fromARGB(255, 8, 24, 241),
                                  child: Center(
                                    child: Icon(Icons.person,
                                        size: 30, color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth / 30,
                                ),
                                Text(
                                  ' New Employess',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                        Divider(
                          thickness: 1,
                        ),
                        Container(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
                            ),
                            title: Text('Lekha '),
                            subtitle: Text('joined on Monday, july 10 '),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    shadowColor: Colors.orange,
                    color: Color.fromARGB(255, 255, 254, 254),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight / 40,
                        ),
                        Align(
                            alignment: Alignment(-0.8, 0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: screenWidth / 20,
                                ),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      Color.fromARGB(255, 173, 223, 36),
                                  child: Center(
                                    child: Icon(Icons.beach_access,
                                        size: 30, color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth / 30,
                                ),
                                Text(
                                  'Upcoming Holidays',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                        Divider(
                          thickness: 1,
                        ),
                        Container(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(''),
                            ),
                            title: Text('Muharam '),
                            subtitle: Text('Saturday '),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    shadowColor: Colors.orange,
                    color: Color.fromARGB(255, 255, 254, 254),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight / 40,
                        ),
                        Align(
                            alignment: Alignment(-0.8, 0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: screenWidth / 20,
                                ),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      Color.fromARGB(255, 37, 184, 241),
                                  child: Center(
                                    child: Icon(Icons.people,
                                        size: 30, color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth / 30,
                                ),
                                Text(
                                  'Team mate leave today',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                        Divider(
                          thickness: 1,
                        ),
                        Container(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
                            ),
                            title: Text('Kishore'),
                            subtitle: Text('Leave on today'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ))
        ],
      ),
    );
    // );
  }
}
