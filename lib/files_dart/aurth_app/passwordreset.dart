import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvelyprojects/files_dart/aurth_app/authpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class passreset extends StatefulWidget {
  const passreset({Key? key}) : super(key: key);

  @override
  State<passreset> createState() => _passresetState();
}

class _passresetState extends State<passreset> {
  TextEditingController resetpass_con = TextEditingController();
  TextEditingController pass1_controller = TextEditingController();
  late String ps, us;

  @override
  void initState() {
    // TODO: implement initState
    showperfer();
  }

  @override
  showperfer() async {
    final showdata = await SharedPreferences.getInstance();
    setState(() {
      us = showdata.getString("username")!;
      ps = showdata.getString("email")!;
    });
  }

  setpreferance() async {
    final prefer = await SharedPreferences.getInstance();
    prefer.setString("password", pass1_controller.text);
  }

  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: hei / 7,
            ),
            Center(
              child: Text("Forgot your password?",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: Color(0xFF505050),
                          fontSize: hei / 30,
                          fontWeight: FontWeight.bold))),
            ),
            SizedBox(
              height: hei / 30,
            ),
            Center(
                child: Text(
              "    Enter your registered email below\n to receive password reset instruction.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.notoSans(
                  textStyle: TextStyle(fontSize: hei / 50),
                  fontWeight: FontWeight.w400),
            )),
            SizedBox(
              height: hei / 15,
            ),
            Image.asset("assets/emailsent.png", height: hei / 5),
            SizedBox(
              height: hei / 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Center(
                child: TextField(
                  controller: resetpass_con,
                  style: TextStyle(fontSize: hei / 30),
                  cursorColor: Color(0xFF505050),
                  decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: hei / 40),
                      filled: true,
                      fillColor: Color(0xFFF4F5F7),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF505050))),
                      border: OutlineInputBorder()),
                ),
              ),
            ),
            SizedBox(
              height: hei / 17,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: wid / 1.4,
                child: Row(
                  children: [
                    Text(
                      "Remember password?",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.notoSans(
                          textStyle: TextStyle(fontSize: hei / 40),
                          fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => auth()));
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.notoSans(
                              textStyle: TextStyle(fontSize: hei / 40),
                              fontWeight: FontWeight.w400,
                              color: Colors.red),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: hei / 37,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 30),
                child: Container(
                  height: hei / 15,
                  width: wid / 1.3,
                  decoration: BoxDecoration(
                    color: Color(0xFF505050),
                  ),
                  child: TextButton(
                      onPressed: () {
                        if (resetpass_con.text == ps ||
                            resetpass_con.text == us) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                    child: SingleChildScrollView(
                                  child: Container(
                                    height: hei / 2,
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/passreset.png",
                                          fit: BoxFit.fill,
                                          height: hei / 5,
                                          width: wid / 3,
                                        ),
                                        Text("Reset Password"),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 38,
                                                right: 38,
                                                top: 5,
                                                bottom: 20),
                                            child: TextField(
                                              controller: pass1_controller,
                                              style:
                                                  TextStyle(fontSize: hei / 30),
                                              decoration: InputDecoration(
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .black12)),
                                                  hintText: "Password",
                                                  prefixIcon: Icon(Icons.lock),
                                                  hintStyle: TextStyle(
                                                      fontSize: hei / 40)),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 38,
                                              right: 38,
                                              top: 5,
                                              bottom: 20),
                                          child: Container(
                                            height: hei / 15,
                                            width: wid / 1.3,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF505050),
                                            ),
                                            child: TextButton(
                                                onPressed: () {
                                                  setpreferance();
                                                  Fluttertoast.showToast(
                                                      msg: "Password Updated");
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              auth()));
                                                },
                                                child: Text(
                                                  "Reset Password",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: hei / 37),
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                              });
                        } else {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return Dialog(
                                    child: Container(
                                  height: hei / 2,
                                  child: Stack(children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                            height: hei / 4,
                                            child: Image.asset(
                                              "assets/wrong.png",
                                              fit: BoxFit.fill,
                                            )),
                                        Center(
                                          child: Text(
                                            "Wrong username or password!",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: hei / 40,
                                                color: Colors.red),
                                          ),
                                        ),
                                        Text(
                                          "Try Again",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: hei / 30,
                                              color: Colors.red),
                                        )
                                      ],
                                    ),
                                    Positioned(
                                      left: hei/2.85,
                                        child: IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: CircleAvatar(
                                              backgroundColor: Colors.red,
                                              child: Icon(
                                                Icons.clear,
                                                color: Colors.white,
                                              ),
                                            )))
                                  ]),
                                ));
                              });
                        }
                      },
                      child: Text(
                        "Send",
                        style:
                            TextStyle(color: Colors.white, fontSize: hei / 37),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
