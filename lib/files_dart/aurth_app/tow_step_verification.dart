import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:marvelyprojects/controlpanel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class tow_step extends StatefulWidget {
  const tow_step({Key? key}) : super(key: key);

  @override
  _tow_stepState createState() => _tow_stepState();
}

class _tow_stepState extends State<tow_step> {
  int number = 0;
  TextEditingController user_con = TextEditingController();
  String username = 'darkhunter6867556@gmail.com';
  String useremaila = 'ashrafiabir@gmail.com';
  String password = 'mvpdarkhunter)';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    generateRandomNumber();
  }

  @override
  getdata() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      useremaila = pref.getString("email")!;
    });
  }

  generateRandomNumber() {
    var random = new Random();
    int a = (random.nextInt(90000) + 90000);
    setState(() {
      number = a;
    });
  }

  Future sendemail() async {
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'Dark Hunter 141')
      ..recipients.add(useremaila)
      ..subject = 'Otp verification'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = '''<div style="font-family: Helvetica,Arial,sans-serif;min-width:1000px;overflow:auto;line-height:2">
  <div style="margin:50px auto;width:70%;padding:20px 0">
    <div style="border-bottom:1px solid #eee">
      <a href="" style="font-size:1.4em;color: #00466a;text-decoration:none;font-weight:600">Marvely</a>
    </div>
    <p style="font-size:1.1em">Hi,</p>
    <p>Thank you for choosing our Brand. Use the following OTP to complete your Sign Up procedures. OTP is valid for 5 minutes</p>
    <h2 style="background: #00466a;margin: 0 auto;width: max-content;padding: 0 10px;color: #fff;border-radius: 4px;">$number</h2>
    <p style="font-size:0.9em;">Regards,<br />Marvely</p>
    <hr style="border:none;border-top:1px solid #eee" />
    <div style="float:right;padding:8px 0;color:#aaa;font-size:0.8em;line-height:1;font-weight:300">
      <p>Marvely LCC</p>
      <p>Most trusted online shopping</p>
    </div>
  </div>
</div>''';
    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      Fluttertoast.showToast(msg: 'Email not sent');
    }
  }

  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: hei / 7,
              ),
              Center(
                child: Text("2-Step Verification",
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
                "Click otp button to send otp",
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
              TextField(
                style: TextStyle(
                  fontSize: 20
                ),
                controller: user_con,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF4F5F7),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF505050))),
                    suffixIcon: TextButton(
                      onPressed: () {
                        sendemail();
                      },
                      child: Text("Send Otp",
                          style: TextStyle(color: Colors.orange, fontSize: 15)),
                    ),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: hei / 10,
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
                          if (number.toString() == user_con.text) {
                            Fluttertoast.showToast(msg: "Sign in approved");
                            Navigator.of(context).push(SwipeablePageRoute(
                                canOnlySwipeFromEdge: true,
                                builder: (BuildContext context) =>main_controlpanel()));
                          } else {
                            Fluttertoast.showToast(msg: "Plase Enter Valid otp");
                          }
                        },
                        child: Text(
                          "Submit Otp",
                          style: TextStyle(
                              color: Colors.white, fontSize: hei / 37),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
