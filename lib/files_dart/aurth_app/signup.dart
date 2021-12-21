import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvelyprojects/files_dart/aurth_app/authpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class singup extends StatefulWidget {
  @override
  _authState createState() => _authState();
}

class _authState extends State<singup> {
  TextEditingController name_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController username_controller = TextEditingController();
  TextEditingController pass1_controller = TextEditingController();
  TextEditingController pass2_controller = TextEditingController();

  String pass_con = "";
  DateTime? _dateTime;
  int getgender = 0;
  getdate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 10),
    );
    setState(() {
      _dateTime = date;
    });
  }

  // getgen() {
  //   if (getgender == 1) {
  //     //Fluttertoast.showToast(msg: "Male");
  //   } else if (getgender == 2) {
  //     //Fluttertoast.showToast(msg: "Female");
  //   }
  // }

  bool bv = false;
  setpreferance() async {
    final prefer = await SharedPreferences.getInstance();

    prefer.setString("username", username_controller.text);
    prefer.setString("password", pass_con);
    prefer.setString("email", email_controller.text);
    prefer.setString("name", name_controller.text);
    prefer.setInt("gender", getgender);
    prefer.setInt("day", _dateTime!.day);
    prefer.setInt("month", _dateTime!.month);
    prefer.setInt("years", _dateTime!.year);
  }

  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFF4F7F9),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: hei / 23,
            ),
            Center(
              child: Text(
                "Sign UP",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: Color(0xFF505050),
                        fontSize: hei / 20,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: hei / 23,
            ),
            // Container(
            //   decoration: BoxDecoration(
            //       color: Color(0xFF505050),
            //       borderRadius:
            //       BorderRadius.only(bottomLeft: Radius.circular(hei / 8))),
            //   height: hei / 3.7,
            //   width: wid,
            //   child: Center(
            //     child: Text(
            //       "Marvely",
            //       style: GoogleFonts.lora(
            //           textStyle: TextStyle(
            //               color: Colors.white,
            //               fontSize: hei / 14,
            //               fontWeight: FontWeight.bold)),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: hei / 27,
            // ),
            Container(
              height: hei / 1.05,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 23,
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 38, right: 38, top: 20, bottom: 20),
                          child: TextField(
                            controller: name_controller,
                            style: TextStyle(fontSize: hei / 30),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12)),
                                hintText: "Name",
                                prefixIcon: Icon(Icons.account_circle_sharp),
                                hintStyle: TextStyle(fontSize: hei / 40)),
                          ),
                        ),
                      ),

                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 38, right: 38, top: 5, bottom: 20),
                          child: TextField(
                            controller: email_controller,
                            style: TextStyle(fontSize: hei / 30),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12)),
                                hintText: "Email",
                                prefixIcon: Icon(Icons.mail),
                                hintStyle: TextStyle(fontSize: hei / 40)),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 38, right: 38, top: 5, bottom: 20),
                          child: TextField(
                            controller: username_controller,
                            style: TextStyle(fontSize: hei / 30),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12)),
                                hintText: "Username",
                                prefixIcon:
                                    Icon(Icons.accessibility_new_outlined),
                                hintStyle: TextStyle(fontSize: hei / 40)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 50, right: 38, top: 5, bottom: 20),
                        child: Container(
                          child: Row(
                            children: [
                              Text(
                                "Gender : ",
                                style: TextStyle(
                                  fontSize: hei / 40,
                                  color: Color(0xFF505050),
                                ),
                              ),
                              Row(
                                children: [
                                  Radio(
                                      value: 1,
                                      groupValue: getgender,
                                      onChanged: (value) {
                                        setState(() {
                                          getgender = value as int;
                                        });
                                      }),
                                  Text(
                                    "Male",
                                    style: TextStyle(
                                      fontSize: hei / 40,
                                      color: Color(0xFF505050),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                      value: 2,
                                      groupValue: getgender,
                                      onChanged: (value) {
                                        setState(() {
                                          getgender = value as int;
                                        });
                                      }),
                                  Text(
                                    "Female",
                                    style: TextStyle(
                                      fontSize: hei / 40,
                                      color: Color(0xFF505050),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),

                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 38, right: 38, top: 5, bottom: 10),
                          child: InkWell(
                            onTap: () {
                              getdate();
                            },
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      getdate();
                                    },
                                    icon: Icon(
                                      Icons.date_range,
                                      color: Color(0xFF505050),
                                      size: hei / 30,
                                    )),
                                Container(
                                    child: _dateTime == null
                                        ? Text(
                                            'Date : DD-MM-YYYY',
                                            style: TextStyle(
                                              fontSize: hei / 40,
                                              color: Color(0xFF505050),
                                            ),
                                          )
                                        : Text(
                                            'Date : ${_dateTime!.day}-${_dateTime!.month}-${_dateTime!.year}',
                                            style: TextStyle(
                                              fontSize: hei / 40,
                                              color: Color(0xFF505050),
                                            ),
                                          )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Color(0xFF505050),
                        indent: hei / 20,
                        endIndent: hei / 20,
                      ),

                      //date

                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 38, right: 38, top: 5, bottom: 20),
                          child: TextField(
                            controller: pass1_controller,
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

                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 38, right: 38, top: 5, bottom: 20),
                          child: TextField(
                            controller: pass2_controller,
                            obscureText: bv == true ? true : false,
                            style: TextStyle(fontSize: hei / 30),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12)),
                                hintText: "Confirm Password",
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
                        height: hei / 34,
                      ),

                      Container(
                        height: hei / 15,
                        width: wid / 1.3,
                        decoration: BoxDecoration(
                          color: Color(0xFF505050),
                        ),
                        child: TextButton(
                            onPressed: () {
                              if (username_controller.text.isNotEmpty &&
                                  pass2_controller.text.isNotEmpty &&
                                  email_controller.text.isNotEmpty &&
                                  _dateTime!.day != 0 &&
                                  name_controller.text.isNotEmpty &&
                                  getgender != 0 &&
                                  pass1_controller.text.isNotEmpty) {
                                if (pass2_controller.text ==
                                    pass1_controller.text) {
                                  setpreferance();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => auth()));
                                  setState(() {
                                    pass_con = pass1_controller.text;
                                  });
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Password not match");
                                }
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Enter Your Valid Data");
                              }
                            },
                            child: Text(
                              "Sign UP",
                              style: TextStyle(
                                  color: Colors.white, fontSize: hei / 37),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: hei / 50,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => auth()));
                },
                child: Text(
                  '''Have an account ? Sign In''',
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: Color(0xFF505050),
                          fontSize: hei / 42,
                          fontWeight: FontWeight.bold)),
                ))
          ],
        ),
      ),
    );
  }
}
