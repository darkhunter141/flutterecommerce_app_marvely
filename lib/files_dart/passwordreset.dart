import 'package:marvelyprojects/files_dart/authpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class passreset extends StatelessWidget {
  const passreset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return Scaffold(
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
                  cursorColor: Color(0xFF505050),
                  decoration: InputDecoration(
                      hintText: "Email",
                      filled: true,
                      fillColor: Color(0xFFF4F5F7),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF505050))),
                      border: OutlineInputBorder()),
                ),
              ),
            ),
            SizedBox(
              height: hei/17,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60,right: 50),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(

                  width: wid,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => auth()));
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
            ),
            SizedBox(
              height: hei/37,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 30),
                child: Container(
                  height: hei / 15,
                  width: wid / 1.3,
                  decoration: BoxDecoration(
                    color: Color(0xFF505050),
                  ),
                  child: TextButton(
                      onPressed: () {
                      },
                      child: Text(
                        "Send",
                        style: TextStyle(
                            color: Colors.white, fontSize: hei / 37),
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
