import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/screens/home_screen.dart';

class EventDescription extends StatefulWidget {
  EventDescription({Key key}) : super(key: key);

  @override
  _EventDescriptionState createState() => _EventDescriptionState();
}

class _EventDescriptionState extends State<EventDescription> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [],
                ),
              ),
              Container(
                height: size.height * 0.5,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    // topLeft: Radius.circular(63),
                    bottomLeft: Radius.circular(63),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 6),
                      blurRadius: 15,
                      color: kPrimaryColor,
                    ),
                  ],
                  image: DecorationImage(
                      image: AssetImage("assets/images/abc.png"),
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.fill),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Text("hi"),
          ),
        ],
      ),
    );
  }
}
