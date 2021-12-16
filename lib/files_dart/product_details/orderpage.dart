import 'package:flutter/material.dart';
import 'package:marvelyprojects/controlpanel.dart';
import 'package:marvelyprojects/custom_widgets/custom_bottomnavigationbar.dart';
import 'package:marvelyprojects/files_dart/homepage/homepage.dart';
import 'package:marvelyprojects/files_dart/product_details/custom_product_display.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class oder_now extends StatefulWidget {
  final custom_product_display selected_product;
  final int product_value;

  @override
  _oder_nowState createState() => _oder_nowState();
  //
  oder_now(this.selected_product, this.product_value);
}

class _oder_nowState extends State<oder_now> {
  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
                height: 300,
                width: 300,
                child: Image.network(widget.selected_product.imgurl)),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Text(
                    "Total : ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "৳" + "${widget.product_value}",
                    style: TextStyle(fontSize: 24, color: Colors.orange),
                  )
                ],
              ),
            ),
            ListTile(
              title: Text(
                "Cash On Delivery",
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(Icons.border_color_sharp),
            ),
            ListTile(
              title: Text(
                "Pay Now",
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(Icons.border_color_sharp),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: hei / 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.redAccent),
                child: Center(
                  child: Text(
                    "Place Oder",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: hei / 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 200,
                  child: ElevatedButton(onPressed: (){
                    Navigator.of(context).push(SwipeablePageRoute(
                        canOnlySwipeFromEdge: true,
                        builder: (BuildContext context) =>main_controlpanel()));
                  }, child:Text ("Back to home"))),
            )
          ],
        ),
      ),
    );
  }
}
