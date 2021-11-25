import 'package:flutter/material.dart';
import 'package:flutter_application_1/Animation/reusableCard.dart';
import 'package:flutter_application_1/constants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.25,
                  child: Stack(
                    children: [
                      Container(
                        height: size.height * 0.25 - 27,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(35),
                            bottomRight: Radius.circular(35),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 128,
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: kBackgroundColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: kPrimaryColor,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ],
                          ),
                          margin:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search_rounded,
                                color: Color(0xffFE5A3F),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 28),
                ReusableCard(
                  name: "sc",
                  img: "assets/images/abc.png",
                  date: "16/04/2021",
                  eventname: "Kick-Start To Flutter",
                  eventtime: "4:00pm-5:00pm",
                ),
                ReusableCard(
                  name: "sc",
                  img: "assets/images/abc.png",
                  date: "16/04/2021",
                  eventname: "Kick-Start To Flutter",
                  eventtime: "4:00pm-5:00pm",
                ),
                ReusableCard(
                  name: "sc",
                  img: "assets/images/abc.png",
                  date: "16/04/2021",
                  eventname: "Kick-Start To Flutter",
                  eventtime: "4:00pm-5:00pm",
                ),
                ReusableCard(
                  name: "sc",
                  img: "assets/images/abc.png",
                  date: "16/04/2021",
                  eventname: "Kick-Start To Flutter",
                  eventtime: "4:00pm-5:00pm",
                ),
                ReusableCard(
                  name: "sc",
                  img: "assets/images/abc.png",
                  date: "16/04/2021",
                  eventname: "Kick-Start To Flutter",
                  eventtime: "4:00pm-5:00pm",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
