import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:marvelyprojects/custom_widgets/custom_appbar.dart';
import 'package:marvelyprojects/custom_widgets/custom_bottomnavigationbar.dart';
import 'package:marvelyprojects/custom_widgets/custom_drawer.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marvelyprojects/custom_widgets/custom_product_display.dart';

class homepage_app extends StatefulWidget {
  @override
  State<homepage_app> createState() => _homepage_appState();
}

class _homepage_appState extends State<homepage_app> {
  final List<String> sliderimageurl = [
    "https://raw.githubusercontent.com/ashrafiabir01/image-project/main/Blue%20%26%20Cyan%20Gradient%20Mega%20Sale%20Promotion%20Offer%20Facebook%20Cover%20(1).png",
    "https://raw.githubusercontent.com/ashrafiabir01/image-project/main/Blue%20%26%20Cyan%20Gradient%20Mega%20Sale%20Promotion%20Offer%20Facebook%20Cover%20(2).png",
    "https://raw.githubusercontent.com/ashrafiabir01/image-project/main/Blue%20%26%20Cyan%20Gradient%20Mega%20Sale%20Promotion%20Offer%20Facebook%20Cover%20(3).png",
    "https://raw.githubusercontent.com/ashrafiabir01/image-project/main/Blue%20%26%20Cyan%20Gradient%20Mega%20Sale%20Promotion%20Offer%20Facebook%20Cover%20(4).png",
    "https://raw.githubusercontent.com/ashrafiabir01/image-project/main/Blue%20%26%20Cyan%20Gradient%20Mega%20Sale%20Promotion%20Offer%20Facebook%20Cover.png"
  ];
  final List<custom_product_display> prouctname = [
    custom_product_display(
        "Product 1",
        "https://github.com/ashrafiabir01/image-project/blob/main/naisproduct.png?raw=true",
        4,
        200,
        0.1),
    custom_product_display(
        "Product 2",
        "https://purepng.com/public/uploads/large/white-tshirt-n0j.png",
        4,
        200,
        0.1),
    custom_product_display(
        "Product 1",
        "https://github.com/ashrafiabir01/image-project/blob/main/naisproduct.png?raw=true",
        4,
        200,
        0.1),
    custom_product_display(
        "Product 2",
        "https://purepng.com/public/uploads/large/white-tshirt-n0j.png",
        4,
        200,
        0.1),
    custom_product_display(
        "Product 1",
        "https://github.com/ashrafiabir01/image-project/blob/main/naisproduct.png?raw=true",
        4,
        200,
        0.1),
    custom_product_display(
        "Product 2",
        "https://purepng.com/public/uploads/large/white-tshirt-n0j.png",
        4,
        200,
        0.1),
    custom_product_display(
        "Product 1",
        "https://github.com/ashrafiabir01/image-project/blob/main/naisproduct.png?raw=true",
        4,
        200,
        0.1),
    custom_product_display(
        "Product 2",
        "https://purepng.com/public/uploads/large/white-tshirt-n0j.png",
        4,
        200,
        0.1),
    custom_product_display(
        "Product 1",
        "https://github.com/ashrafiabir01/image-project/blob/main/naisproduct.png?raw=true",
        4,
        200,
        0.1),
    custom_product_display(
        "Product 2",
        "https://purepng.com/public/uploads/large/white-tshirt-n0j.png",
        4,
        200,
        0.1),
    custom_product_display(
        "Product 1",
        "https://github.com/ashrafiabir01/image-project/blob/main/naisproduct.png?raw=true",
        4,
        200,
        0.1),
    custom_product_display(
        "Product 2",
        "https://purepng.com/public/uploads/large/white-tshirt-n0j.png",
        4,
        200,
        0.1),
    custom_product_display(
        "Product 1",
        "https://github.com/ashrafiabir01/image-project/blob/main/naisproduct.png?raw=true",
        4,
        200,
        0.1),
    custom_product_display(
        "Product 2",
        "https://purepng.com/public/uploads/large/white-tshirt-n0j.png",
        4,
        200,
        0.1),
    custom_product_display(
        "Product 1",
        "https://github.com/ashrafiabir01/image-project/blob/main/naisproduct.png?raw=true",
        4,
        200,
        0.1),
    custom_product_display(
        "Product 2",
        "https://purepng.com/public/uploads/large/white-tshirt-n0j.png",
        4,
        200,
        0.1),
  ];
  @override
  void initState() {
    // TODO: implement initState
  }
  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: custom_drawer(),
      appBar: CustomAppBar(),
      bottomNavigationBar: custom_bottomnavigationbar(),
      body: DoubleBack(
        child: SafeArea(
          child: Column(
            children: [
              // Header Slider
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: hei / 6,
                    child: CarouselSlider.builder(
                        autoSliderTransitionTime: Duration(seconds: 1),
                        autoSliderDelay: Duration(seconds: 5),
                        enableAutoSlider: true,
                        unlimitedMode: true,
                        slideTransform: ParallaxTransform(),
                        slideBuilder: (context) {
                          return Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        NetworkImage(sliderimageurl[context]),
                                    fit: BoxFit.fill),
                                color: Color(0xffEDEFF0),
                                borderRadius:
                                    BorderRadiusDirectional.circular(13)),
                            alignment: Alignment.center,
                          );
                        },
                        itemCount: sliderimageurl.length),
                  ),
                ),
              ),
              // CategoryText
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 5, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Catagory",
                        style: TextStyle(
                            fontSize: hei / 38, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              "More",
                              style: TextStyle(
                                  fontSize: hei / 45,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              // Category button
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffEDEFF0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: hei / 4.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: hei / 9,
                                width: wid / 6,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/catimg1.png",
                                      height: hei / 13,
                                      width: wid / 6,
                                    ),
                                    Text(
                                      "Gifts",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: hei / 55,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: hei / 9,
                                width: wid / 6,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/catimg2.png",
                                      height: hei / 13,
                                      width: wid / 6,
                                    ),
                                    Text(
                                      "Discounts",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: hei / 55,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: hei / 9,
                                width: wid / 6,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/catimg3.png",
                                      height: hei / 13,
                                      width: wid / 6,
                                    ),
                                    Text(
                                      "Shirts",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: hei / 55,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: hei / 9,
                                width: wid / 6,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/catimg4.png",
                                      height: hei / 13,
                                      width: wid / 6,
                                    ),
                                    Text(
                                      "Foods",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: hei / 55,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: hei / 9,
                                width: wid / 6,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/catimg5.png",
                                      height: hei / 13,
                                      width: wid / 6,
                                    ),
                                    Text(
                                      "Health",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: hei / 55,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: hei / 9,
                                width: wid / 6,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/catimg6.png",
                                      height: hei / 13,
                                      width: wid / 6,
                                    ),
                                    Text(
                                      "Live Tv",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: hei / 55,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: hei / 9,
                                width: wid / 6,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/catimg7.png",
                                      height: hei / 13,
                                      width: wid / 6,
                                    ),
                                    Text(
                                      "Global",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: hei / 55,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: hei / 9,
                                width: wid / 6,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/catimg8.png",
                                      height: hei / 13,
                                      width: wid / 6,
                                    ),
                                    Text(
                                      "Local",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: hei / 55,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // top products
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 5, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Product",
                      style: TextStyle(
                          fontSize: hei / 38, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            "More",
                            style: TextStyle(
                                fontSize: hei / 45,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                          )),
                    )
                  ],
                ),
              ),
              // top product list
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    itemCount: prouctname.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (Buildercontext, context) {
                      return Container(
                        child: Card(
                          child: Column(
                            children: [
                              Image.network(prouctname[context].imgurl),
                            ],
                          ),
                        ),
                      );
                    }),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
