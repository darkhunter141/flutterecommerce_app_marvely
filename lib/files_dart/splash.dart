import 'dart:async';

import 'package:marvelyprojects/files_dart/authpage.dart';
import 'package:marvelyprojects/files_dart/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
class splash extends StatefulWidget {


  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  bool pageopen = true;
  @override

  void initState() {
    getpageopen();
    pageopen==false ? Timer(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>homepage_app()));
    }):Timer(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>auth()));
    });


  }
  @override
  getpageopen ()async {
    final prefersget = await SharedPreferences.getInstance();
    setState(() {
     pageopen = prefersget.getBool("pagedecidevalue")!;
     pageopen=!pageopen;

    });

  }
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF422C94),
      body: SafeArea (
        child: SingleChildScrollView (
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            height: hei,
            decoration: BoxDecoration(
            gradient: LinearGradient (
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF422C94),
                Color(0xFF395AAD),
                Color(0xFF317BBD),



              ]
            )
            ),
            child: Column  (
              children: [
                SizedBox(height: hei/2.7,),
                   Center(
                     child: Text ("Marvely",style: GoogleFonts.lora(textStyle: TextStyle(
                         color: Colors.white,fontSize: hei/11,fontWeight:FontWeight.bold
                     ))),

                   ),
                SizedBox(height: hei/48.7,),
                Text(''' "Most trusted online shopping" ''',style: TextStyle(
                  color: Colors.white,fontSize: hei/43
                ),),
                SizedBox(height: hei/20,),
                CircularProgressIndicator(
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
