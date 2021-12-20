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
      body: SafeArea(
          child: Center(
        child: SafeArea(
          child: ListView(
            children: [
              GridView.builder(
                shrinkWrap: true,
                  itemCount: cart_product.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (Buildercontext, index) {
                    return Container(
                      child: Text (''),
                    );
                  })
            ],
          ),
        ),
      )),
    );
  }
}
