import 'package:flutter/material.dart';

class cart extends StatefulWidget {

  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {

  List<String> cart_product = ['d','',''];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFF505050),
        title: Text("Cart"),
      ),
      body: SafeArea(
          child: Center(
        child: SafeArea(
          child: Center(

            child:Text("Nais Cart",style: TextStyle(color: Colors.black,fontSize:60,fontWeight: FontWeight.bold)),
          ),
        ),
      )),
    );
  }
}
