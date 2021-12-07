import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  String username_value = "";
  String pass_value = "";
  String name_value = "";
  String email_value = "";
  int gender_value = 0;
  int day_value = 0;
  int month_value = 0;
  int year_value = 0;

  @override
  void initState() {
    showperfer();
  }

  @override
  showperfer() async {
    final showdata = await SharedPreferences.getInstance();
    setState(() {
      username_value = showdata.getString("username")!;
      pass_value = showdata.getString("password")!;
      name_value = showdata.getString("name")!;
      email_value = showdata.getString("email")!;
      gender_value = showdata.getInt("gender")!;
      day_value = showdata.getInt("day")!;
      year_value = showdata.getInt("years")!;
      month_value = showdata.getInt("month")!;
    });
  }

  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(

              color: Color(0xFF505050),
              height: hei/3,
              child: gender_value == 2 ? Text("Female") : Text("Male"),
            ),
            Text("$username_value"),
            Text("$name_value"),
            Text("$email_value"),
            Text("$pass_value"),
            Text("$day_value $month_value $year_value"),
            Container(
              child: gender_value == 2 ? Text("Female") : Text("Male"),
            )
          ],
        ),
      ),
    );
  }
}
