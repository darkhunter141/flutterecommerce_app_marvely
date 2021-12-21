import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marvelyprojects/files_dart/product_details/custom_product_display.dart';
import 'package:marvelyprojects/files_dart/product_details/orderpage.dart';

class customproduct_details extends StatefulWidget {
  final custom_product_display product_details;

  @override
  _customproduct_detailsState createState() => _customproduct_detailsState();

  customproduct_details(this.product_details);
}

class _customproduct_detailsState extends State<customproduct_details> {
  @override
  void initState() {
    total_product_value = widget.product_details.proprice;
  }

  @override
  int product_cart = 1;
  late int total_product_value = 1;

  cheacknumber() {
    setState(() {
      if (product_cart < 2) {
        product_cart = 1;

      }
    });
  }
  cheackvalue(){
    setState(() {
      if (total_product_value<widget.product_details.proprice){
        total_product_value = widget.product_details.proprice;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;

    show_cart(){
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return StatefulBuilder(builder:
                (BuildContext context, StateSetter setState) {
              return Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: hei / 10,
                          width: wid / 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.network(
                              widget.product_details.imgurl),
                        ),
                        Column(
                          children: [
                            Text(
                              "৳" +
                                  widget.product_details.proprice
                                      .toString(),
                              style: TextStyle(
                                  fontSize: hei / 35,
                                  color: Colors.orange),
                            ),
                            Text(
                              "৳" +
                                  widget.product_details.price
                                      .toString(),
                              style: TextStyle(
                                  fontSize: hei / 43,
                                  decoration:
                                  TextDecoration.lineThrough,
                                  decorationThickness: 1.6),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: wid / 2,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.cancel,
                              size: hei / 25,
                            ))
                      ],
                    ),
                    SizedBox(height: hei / 40),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(height: hei / 40),
                    Padding(
                      padding: EdgeInsets.only(
                          top: hei / 150,
                          left: wid / 75,
                          right: wid / 75,
                          bottom: hei / 150),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Quantity",
                            style: TextStyle(fontSize: hei / 43),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      product_cart--;
                                      cheacknumber();
                                      total_product_value =
                                          total_product_value -
                                              widget.product_details
                                                  .proprice;
                                      cheackvalue();
                                    });
                                  },
                                  icon: CircleAvatar(
                                    maxRadius: 20,
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24),
                                    ),
                                    backgroundColor: Colors.black,
                                  )),

                              SizedBox(width: 5),
                              Text(
                                "$product_cart",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: hei / 30),
                              ),
                              SizedBox(width: 5),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      product_cart++;
                                      total_product_value = widget
                                          .product_details
                                          .proprice *
                                          product_cart;
                                    });
                                  },
                                  icon: CircleAvatar(
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24),
                                    ),
                                    maxRadius: 20,
                                    backgroundColor: Colors.black,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: hei / 40),
                    Divider(
                      thickness: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: hei / 150,
                          left: wid / 75,
                          right: wid / 75,
                          bottom: hei / 150),
                      child: Row(
                        children: [
                          Text(
                            "Total : ",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "৳" + "$total_product_value",
                            style: TextStyle(
                                fontSize: 24, color: Colors.orange),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: hei / 7,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: hei / 150,
                          left: wid / 75,
                          right: wid / 75,
                          bottom: hei / 150),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: wid / 2.2,
                            height: hei / 15,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(6),
                                color: Colors.redAccent),
                            child: Center(
                              child: Text(
                                "Add to Cart",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: hei / 42,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>oder_now(widget.product_details,total_product_value)));
                            },
                            child: Container(
                              width: wid / 2.2,
                              height: hei / 15,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(6),
                                  color: Colors.orange),
                              child: Center(
                                child: Text(
                                  "Buy Now",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: hei / 42,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
              ;
            });
          });
    }


    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: hei / 11,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.storefront_sharp),
                  iconSize: hei / 28,
                  color: Colors.orange),
              Padding(
                padding: EdgeInsets.only(top: hei / 100, bottom: hei / 100),
                child: VerticalDivider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chat),
                  iconSize: hei / 28,
                  color: Colors.orange),
              SizedBox(width: wid / 13),
              InkWell(
                onTap: () {
                 show_cart();
                },
                child: Container(
                  width: wid / 3.5,
                  height: hei / 15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.redAccent),
                  child: Center(
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: hei / 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: wid / 40),
              InkWell(
                onTap: (){
                  show_cart();
                },
                child: Padding(
                  padding: EdgeInsets.only(right: wid / 50),
                  child: Container(
                    width: wid / 3.5,
                    height: hei / 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.orange),
                    child: Center(
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: hei / 42,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF505050),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart, size: hei / 30)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border, size: hei / 30))
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, size: hei / 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              color: Color(0xffEDEFF0),
              height: hei / 3,
              width: double.infinity,
              child: Image.network(
                widget.product_details.imgurl,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: hei / 150,
                  left: wid / 75,
                  right: wid / 75,
                  bottom: hei / 150),
              child: Row(
                children: [
                  Text(
                    "৳" + widget.product_details.proprice.toString(),
                    style: TextStyle(
                        fontSize: hei / 26,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: wid / 2),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline),
                    iconSize: hei / 27,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.share),
                    iconSize: hei / 27,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: hei / 150,
                  left: wid / 75,
                  right: wid / 75,
                  bottom: hei / 150),
              child: Row(
                children: [
                  Text(
                    "৳" + widget.product_details.price.toString(),
                    style: TextStyle(
                        fontSize: hei / 43,
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 1.6),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(widget.product_details.parcentage,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: hei / 40))
                ],
              ),
            ),
            SizedBox(height: hei / 150),
            Padding(
              padding: EdgeInsets.only(
                  top: hei / 150,
                  left: wid / 75,
                  right: wid / 75,
                  bottom: hei / 150),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.product_details.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: hei / 47),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: hei / 150,
                  left: wid / 75,
                  right: wid / 75,
                  bottom: hei / 150),
              child: Row(
                children: [
                  RatingBarIndicator(
                    itemCount: 5,
                    itemSize: 20,
                    rating: widget.product_details.rating,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(widget.product_details.rating.toString()),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: wid / 75, right: wid / 75),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Variations",
                        style: TextStyle(fontSize: hei / 43),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.forward))
                    ],
                  )
                ],
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: hei / 150,
                  left: wid / 75,
                  right: wid / 75,
                  bottom: hei / 150),
              child: Row(
                children: [
                  Text(
                    "Description",
                    style: TextStyle(fontSize: hei / 43),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: hei / 150,
                  left: wid / 75,
                  right: wid / 75,
                  bottom: hei / 150),
              child: Text(
                "E-commerce (electronic commerce) is the buying and selling of goods and services, or the transmitting of funds or data, over an electronic network, primarily the internet. These business transactions occur either as business-to-business (B2B), business-to-consumer (B2C), consumer-to-consumer or consumer-to-business.",
                style: TextStyle(
                  fontSize: hei / 43,
                ),
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
