import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvelyprojects/custom_widgets/custom_drawer.dart';
import 'package:marvelyprojects/files_dart/about_developer/aboutme.dart';
import 'package:marvelyprojects/files_dart/aurth_app/authpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

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
  setpageopen() async {
    final preferset = await SharedPreferences.getInstance();
    preferset.setString("pagedecidevalue","0");
  }
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
      backgroundColor: Color(0xFF505050),
      drawer: custom_drawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF505050),
        elevation: 0,
        title: Text("My Profile"),
      ),
      body: SingleChildScrollView(

        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: hei/7.5,
                  color: Color(0xFF505050),
                ),
                Container(
                  height: hei/1.31,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 45,top:10),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text ('$name_value',style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: hei/45
                                      ),),
                                      Text ('$email_value',style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: hei/45
                                      ),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: hei/55),
                      Divider(
                        thickness: 0.1,
                          color: Color(0xFF505050),
                      ),
                      TextButton(onPressed: (){},
                        child: ListTile(
                          leading: Icon (Icons.account_circle_sharp,size: hei/23),
                          trailing:  Icon (Icons.arrow_forward ,size: hei/23),
                          title: Text ("Account Information",style: GoogleFonts.notoSans(textStyle: TextStyle(
                            fontSize: hei/45,fontWeight: FontWeight.w400,
                          )),),
                        ),
                      ),
                      TextButton(onPressed: (){},
                        child: ListTile(
                            leading: Icon (Icons.shop_outlined,size: hei/23),
                           trailing:  Icon (Icons.arrow_forward ,size: hei/23),
                           title: Text ("My Orders",style: GoogleFonts.notoSans(textStyle: TextStyle(
                             fontSize: hei/45,fontWeight: FontWeight.w400,
                           )),),
                        ),
                      ),
                      TextButton(onPressed: (){},
                        child: ListTile(
                          leading: Icon (Icons.location_on_outlined,size: hei/23),
                          trailing:  Icon (Icons.arrow_forward ,size: hei/23),
                          title: Text ("My Delivery Address",style: GoogleFonts.notoSans(textStyle: TextStyle(
                            fontSize: hei/45,fontWeight: FontWeight.w400,
                          )),),
                        ),
                      ),

                      TextButton(onPressed: (){},
                        child: ListTile(
                          leading: Icon ( Icons.policy_outlined,size: hei/23),
                          trailing:  Icon (Icons.arrow_forward ,size: hei/23),
                          title: Text ("Privacy Policy",style: GoogleFonts.notoSans(textStyle: TextStyle(
                            fontSize: hei/45,fontWeight: FontWeight.w400,
                          )),),
                        ),
                      ),
                      TextButton(onPressed: (){
                        Navigator.of(context).push(SwipeablePageRoute(
                            canOnlySwipeFromEdge: true,
                            builder: (BuildContext context) =>about_developer()));
                      },
                        child: ListTile(
                          leading: Icon (Icons.add_chart,size: hei/23),
                          trailing:  Icon (Icons.arrow_forward ,size: hei/23),
                          title: Text ("About Developer",style: GoogleFonts.notoSans(textStyle: TextStyle(
                            fontSize: hei/45,fontWeight: FontWeight.w400,
                          )),),
                        ),
                      ),
                      TextButton(onPressed: (){
                        Navigator.of(context).push(SwipeablePageRoute(
                            canOnlySwipeFromEdge: true,
                            builder: (BuildContext context) =>auth()));
                        setpageopen();

                      },
                        child: ListTile(
                          leading: Icon (Icons.exit_to_app_outlined,size: hei/23),
                          trailing:  Icon (Icons.arrow_forward ,size: hei/23),
                          title: Text ("Logout",style: GoogleFonts.notoSans(textStyle: TextStyle(
                            fontSize: hei/45,fontWeight: FontWeight.w400,
                          )),),
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),
            Positioned(
                top: hei/15,
                left: hei / 20,
                child: CircleAvatar(
                  radius: hei/16,
                  backgroundColor: Color(0xFF505050),
                  child: CircleAvatar(
                    radius: hei/18,
                    backgroundImage: gender_value == 2 ? AssetImage('assets/female.png'):AssetImage('assets/male.png'),
                  ),
                )),
          ],
        ),
      ),

    );
  }
}
