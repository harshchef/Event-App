import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Animation/FadeAnimation.dart';
import 'package:flutter_application_1/screens/home_screen.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MobileVerificationState currentstate =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId;
  bool showloading = false;
  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showloading = true;
    });
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showloading = false;
      });
      if (authCredential?.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message),
      ));
    }
  }

  getMobileformWidget(context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background/background.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 25, top: 40),
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Text(
                                    "Hello,",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  )),
                              Container(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Text(
                                    "VITian",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 38,
                                        fontWeight: FontWeight.w500),
                                  )),
                            ],
                          ),
                          FadeAnimation(
                            1.6,
                            Container(
                              // padding: EdgeInsets.only(left: 5, top: 40),
                              child: Image(
                                image: AssetImage(
                                    "assets/ilustration/ilustration2.png"),
                                height: 200,
                                width: 200,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 150,
                      ),
                      Container(
                        width: 330,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                "Phone Number",
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xffFE5A3F)),
                              ),
                            ),
                            TextField(
                              controller: phoneController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFE5A3F))),
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Color(0xffFE5A3F),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 60,
                        child: MaterialButton(
                          onPressed: () async {
                            setState(() {
                              showloading = true;
                            });
                            await _auth.verifyPhoneNumber(
                              phoneNumber: "+91" + phoneController.text,
                              verificationCompleted:
                                  (phoneAuthCredential) async {
                                setState(() {
                                  showloading = false;
                                });
                              },
                              verificationFailed: (verifiactionfailed) async {
                                setState(() {
                                  showloading = false;
                                });
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(verifiactionfailed.message),
                                ));
                              },
                              codeSent: (verificationId, resendingToken) async {
                                setState(() {
                                  showloading = false;
                                  currentstate = MobileVerificationState
                                      .SHOW_OTP_FORM_STATE;
                                  this.verificationId = verificationId;
                                });
                              },
                              codeAutoRetrievalTimeout: (verificationId) async {
                                setState(() {
                                  showloading = false;
                                });
                              },
                            );
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.all(0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffFE5A3F),
                                    Color(0xffE67332)
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                                borderRadius: BorderRadius.circular(30)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 260.0, minHeight: 60.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Send OTP",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  getOTPformWidget(context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background/background.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 25, top: 20),
                      ),
                      Row(
                        children: <Widget>[
                          FadeAnimation(
                            1.6,
                            Container(
                              padding: EdgeInsets.only(left: 30, top: 40),
                              child: Image(
                                image: AssetImage(
                                    "assets/ilustration/ilustration1.png"),
                                height: 200,
                                width: 200,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 160,
                      ),
                      Container(
                        width: 330,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                "OTP",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xffFE5A3F),
                                ),
                              ),
                            ),
                            TextField(
                              controller: otpController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffFE5A3F))),
                                prefixIcon: Icon(
                                  Icons.vpn_key_rounded,
                                  color: Color(0xffFE5A3F),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 60,
                        child: MaterialButton(
                          onPressed: () async {
                            PhoneAuthCredential phoneAuthCredential =
                                PhoneAuthProvider.credential(
                                    verificationId: verificationId,
                                    smsCode: otpController.text);
                            signInWithPhoneAuthCredential(phoneAuthCredential);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.all(0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffFE5A3F),
                                    Color(0xffE67332)
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                                borderRadius: BorderRadius.circular(30)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 260.0, minHeight: 60.0),
                              alignment: Alignment.center,
                              child: Text(
                                "VERIFY",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: showloading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : currentstate == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                ? getMobileformWidget(context)
                : getOTPformWidget(context),
      ),
    );
  }
}
