import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/screens/event_Description.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {this.name,
      this.img,
      this.eventname,
      this.date,
      this.rglink,
      this.meetlink,
      this.eventtime});
  final String name;
  final String img;
  final String eventname;
  final String rglink;
  final String meetlink;
  final String date;
  final String eventtime;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EventDescription()));
      },
      child: Column(
        children: [
          Container(
            height: 120,
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
              ],
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0), //or 15.0
                  child: Container(
                    height: 95.0,
                    width: 95.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(img), fit: BoxFit.fill),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Event:- " + eventname),
                      Text("Date:- " + date),
                      Text("Time:- " + eventtime),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
