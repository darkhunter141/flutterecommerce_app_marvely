import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:marvelyprojects/files_dart/aurth_app/authpage.dart';

class page_view extends StatefulWidget {
  const page_view({Key? key}) : super(key: key);

  @override
  _page_viewState createState() => _page_viewState();
}

class _page_viewState extends State<page_view> {
  int page_value = 0;
  int page_index = 0;
  List<Widget> pages = [
    Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/page2.png"), fit: BoxFit.fill)),
    ),
    Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/page1.png"), fit: BoxFit.fill)),
    ),
    Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/page3.png"), fit: BoxFit.fill)),
    ),
    Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/page4.png"), fit: BoxFit.fill)),
    ),
  ];
  PageController _pageController = PageController(initialPage: 0);
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (page_index < 5) {
        page_index++;
      } else {
        page_index = 0;
      }

      _pageController.animateToPage(
        page_index,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: hei / 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Marvely",
                  style: TextStyle(
                    fontSize: wid / 8,
                    color: Color(0xFF505050),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Welcome to Marvely.Let's Shoping!",
                  style: TextStyle(
                    fontSize: wid / 20,
                    color: Color(0xFF505050),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: hei / 100,
            ),
            Container(
              height: hei / 2,
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    page_value = index;
                  });
                },
                controller: _pageController,
                children: pages,
              ),
            ),
            DotsIndicator(
                dotsCount: 4,
                decorator: DotsDecorator(
                  activeColor: Color(0xFF505050),
                  size: Size.square(9.0),
                  activeSize: Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                position: page_value.toDouble()),
            SizedBox(
              height: hei / 13,
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      primary: Color(0xFF505050),
                      fixedSize: Size(wid / 1.3, 55)),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>auth()));
                  },
                  child: Text("Continue", style: TextStyle(fontSize: 20))),
            )
          ],
        ),
      ),
    );
  }
}
