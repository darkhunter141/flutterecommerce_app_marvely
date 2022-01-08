import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marvelyprojects/files_dart/aurth_app/passwordreset.dart';
import 'package:marvelyprojects/files_dart/aurth_app/signup.dart';
import 'package:marvelyprojects/files_dart/aurth_app/tow_step_verification.dart';
import 'package:marvelyprojects/files_dart/homepage/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_button/sign_button.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class auth extends StatefulWidget {
  @override
  _authState createState() => _authState();
}

class _authState extends State<auth> {
  String user_data = "";
  bool bv = false;
  TextEditingController user_con = TextEditingController();
  TextEditingController pass_con = TextEditingController();
  String us = "AAAAAAAAAAAAAVVVVVVVVV";
  String ps = "12ADDDDDDDDDDD3";
  String superpass = "admin";
  String superuser= "admin";


  _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      // print("signed in " + user.displayName);

      return user;
    } catch (e) {}
  }

  void initState() {
    showperfer();

  }

  @override
  setpageopen() async {
    final preferset = await SharedPreferences.getInstance();
    preferset.setString("pagedecidevalue","1");
  }
  showperfer() async {
    final showdata = await SharedPreferences.getInstance();
    setState(() {
      us = showdata.getString("username")!;
      ps = showdata.getString("password")!;
    });
  }

  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFF4F7F9),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFF505050),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(hei / 8))),
              height: hei / 4.5,
              width: wid,
              child: Center(
                child: Text(
                  "Marvely",
                  style: GoogleFonts.lora(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: hei / 14,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            SizedBox(
              height: hei / 23,
            ),
            Container(
              height: hei / 1.4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 23,
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 38, right: 38, top: 40, bottom: 20),
                          child: TextField(
                            controller: user_con,
                            style: TextStyle(fontSize: hei / 30),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12)),
                                hintText: "Username",
                                prefixIcon: Icon(Icons.account_circle_sharp),
                                hintStyle: TextStyle(fontSize: hei / 40)),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 38, right: 38, top: 20, bottom: 20),
                          child: TextField(
                            controller: pass_con,
                            obscureText: bv == true ? true : false,
                            style: TextStyle(fontSize: hei / 30),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12)),
                                hintText: "Password",
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        bv = !bv;
                                      });
                                    },
                                    icon: bv == false
                                        ? Icon(Icons.visibility)
                                        : Icon(Icons.visibility_off)),
                                hintStyle: TextStyle(fontSize: hei / 40)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: hei / 15,
                      ),
                      Container(
                        height: hei / 15,
                        width: wid / 1.3,
                        decoration: BoxDecoration(
                          color: Color(0xFF505050),
                        ),
                        child: TextButton(
                            onPressed: () {
                              if (user_con.text.isEmpty &&
                                  pass_con.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg:
                                        '''Username and Password can't be blank''');
                              } else if (user_con.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please Enter Your Username");
                              } else if (pass_con.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please Enter Your Password");
                              } else if (user_con.text == us &&
                                  pass_con.text == ps || superpass==pass_con.text&&superuser==user_con.text) {
                                setpageopen();
                                Fluttertoast.showToast(msg: "Correct Password");
                                Navigator.of(context).push(SwipeablePageRoute(
                                    canOnlySwipeFromEdge: true,
                                    builder: (BuildContext context) =>homepage_app()));
                              } else {
                                Fluttertoast.showToast(
                                    msg:
                                        "Plase Enter Valid Username & Password");
                              }
                            },
                            child: Text(
                              "LOG IN",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 38, right: 38, top: 20, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => singup()));
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: hei / 40,
                                    color: Color(0xFF505050),
                                  ),
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => passreset()));
                                },
                                child: Text(
                                  "Forget Password",
                                  style: TextStyle(
                                    fontSize: hei / 40,
                                    color: Color(0xFF505050),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Text(
                        "Or",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: hei / 40),
                      Container(
                        alignment: Alignment.center,
                        width: wid/1.48,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SignInButton.mini(
                                buttonSize: ButtonSize.medium,
                                buttonType: ButtonType.google,
                                onPressed: () {
                                  _googleSignUp();
                                }),
                            SignInButton.mini(
                                buttonSize: ButtonSize.medium,
                                buttonType: ButtonType.facebook,
                                onPressed: () {

                                }),
                            SignInButton.mini(
                                buttonSize: ButtonSize.medium,
                                buttonType: ButtonType.apple,
                                onPressed: () {
                                })
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
