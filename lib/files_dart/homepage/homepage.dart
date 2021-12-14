import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marvelyprojects/custom_widgets/custom_appbar.dart';
import 'package:marvelyprojects/custom_widgets/custom_bottomnavigationbar.dart';
import 'package:marvelyprojects/custom_widgets/custom_drawer.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marvelyprojects/custom_widgets/custom_product_display.dart';
import 'package:marvelyprojects/files_dart/product_details/custom_product_details.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class homepage_app extends StatefulWidget {
  @override
  State<homepage_app> createState() => _homepage_appState();
}

class _homepage_appState extends State<homepage_app> {
  bool favorite_icon_color = true;
  final List<String> sliderimageurl = [
    "assets/sliderimage1.png",
    'assets/sliderimage2.png',
    'assets/sliderimage3.png',
    'assets/sliderimage4.png',
    'assets/sliderimage5.png'
  ];
  final List<custom_product_display> prouctname = [
    custom_product_display(
        "Stylish Black Shirt",
        "https://github.com/ashrafiabir01/image-project/blob/main/naisproduct.png?raw=true",
        5,
        200,
        0.1,
        "55%",
        500),
    custom_product_display(
        "Stylish White Shirt",
        "https://purepng.com/public/uploads/large/purepng.com-white-mens-polo-shirtpolo-shirtcottongarmentsfebricwhitemens-1421526392154xt9zg.png",
        4.6,
        220,
        0.1,
        "80%",
        340),
    custom_product_display(
        "Stylish Blue Shirt",
        "https://purepng.com/public/uploads/large/purepng.com-blue-t-shirtclothingt-shirtt-shirtdressfashionclothshirt-691522330467vjhb0.png",
        5,
        1200,
        0.1,
        "30%",
        1500),
    custom_product_display(
        "Stylish Red Shirt",
        "https://purepng.com/public/uploads/large/red-t-shirt-plp.png",
        5,
        600,
        0.1,
        "40%",
        900),
    custom_product_display(
        "Stylish Green Shirt",
        "https://purepng.com/public/uploads/large/purepng.com-green-t-shirtclothingt-shirtt-shirtdressfashionclothshirt-691522330493iyjsl.png",
        5,
        240,
        0.1,
        "22%",
        400),
    custom_product_display(
        "Yellow Polo Shirt",
        "https://purepng.com/public/uploads/large/purepng.com-yellow-polo-shirtpolo-shirtcottongarmentsfebricpurple-1421526392119beols.png",
        5,
        00,
        0.1,
        "100%",
        1500),
    custom_product_display(
        "Stylish Red Shirt",
        "https://purepng.com/public/uploads/large/purepng.com-t-shirtclothingt-shirtfashion-dress-shirt-cloth-tshirt-631522326894filwv.png",
        5,
        1990,
        0.1,
        "20%",
        2300),
    custom_product_display(
        "Stylish Orenge Shirt",
        "https://purepng.com/public/uploads/large/purepng.com-t-shirt-orangefashiondressshirtclothtshirtclothingt-shirt-orange-631522326912s0fqp.png",
        5,
        786,
        0.1,
        "30%",
        1000),
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
          child: ListView(
            children: [
              // Header Slider
              Container(
                child: Padding(
                  padding:EdgeInsets.only(top: hei/150,left: wid/75,right: wid/75,bottom: hei/150),
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
                                    image: AssetImage(sliderimageurl[context]),
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
              Padding(
                padding:EdgeInsets.only(top: hei/150,left: wid/75,right: wid/75,bottom: hei/150),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Catagory",
                        style: TextStyle(
                            fontSize: hei / 40, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "More",
                          style: TextStyle(
                              fontSize: hei / 45,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // Category button
              Padding(
                padding:EdgeInsets.only(top: hei/150,left: wid/75,right: wid/75,bottom: hei/150),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffEDEFF0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: hei / 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Padding(
                                padding:EdgeInsets.only(top: hei/100,left: wid/75,right: wid/75,bottom: hei/150),
                                child: Container(
                                  height: hei / 12,
                                  width: wid / 6,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/catimg1.png",
                                        height: hei / 17,
                                        width: wid / 8,
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
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: hei / 12,
                                width: wid / 6,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/catimg2.png",
                                      height: hei / 17,
                                      width: wid / 8,
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
                                height: hei / 12,
                                width: wid / 6,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/catimg3.png",
                                      height: hei / 17,
                                      width: wid / 8,
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
                                height: hei / 12,
                                width: wid / 6,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/catimg4.png",
                                      height: hei / 17,
                                      width: wid / 8,
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
                                height: hei / 12,
                                width: wid / 6,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/catimg5.png",
                                      height: hei / 17,
                                      width: wid / 8,
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
                                height: hei / 12,
                                width: wid / 6,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/catimg6.png",
                                      height: hei / 17,
                                      width: wid / 8,
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
                                height: hei / 12,
                                width: wid / 6,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/catimg7.png",
                                      height: hei / 17,
                                      width: wid / 8,
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
                                height: hei / 12,
                                width: wid / 6,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/catimg8.png",
                                      height: hei / 17,
                                      width: wid / 8,
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
                padding:EdgeInsets.only(top: hei/150,left: wid/75,right: wid/75,bottom: hei/150),
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
                      child: Text(
                        "More",
                        style: TextStyle(
                            fontSize: hei / 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                    )
                  ],
                ),
              ),
              // top product list
              GridView.builder(
                  shrinkWrap: true,
                  controller: ScrollController(keepScrollOffset: true),
                  itemCount: prouctname.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.62,
                      crossAxisCount: 2),
                  itemBuilder: (Buildercontext, index) {
                    return Padding(
                      padding:EdgeInsets.only(left: wid/75,right: wid/75,bottom: hei/150),
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(SwipeablePageRoute(
                            canOnlySwipeFromEdge: true,
                            builder: (BuildContext context) => customproduct_details(prouctname[index])
                          ));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 20,
                          child: Column(
                            children: [
                              Padding(
                                padding:EdgeInsets.only(top: hei/150,left: wid/75,right: wid/75,bottom: hei/150),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Color(0xFF505050),
                                      child: Text(
                                        prouctname[index].parcentage,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.favorite_border,
                                            size: hei / 23),
                                        onPressed: () {})
                                  ],
                                ),
                              ),
                              Image.network(prouctname[index].imgurl,height: hei/5.2,width: wid/2.5,),
                              SizedBox(
                                height: hei / 140,
                              ),
                              Text(prouctname[index].title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: hei / 45,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: hei / 140,
                              ),
                              Padding(
                                padding:EdgeInsets.only(left: wid/30),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: wid / 70,
                                    ),
                                    Text(
                                      "৳" +
                                          prouctname[index].proprice.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange,
                                          fontSize: hei / 33),
                                    ),
                                    SizedBox(
                                      width: wid / 77,
                                    ),
                                    Text(
                                      "৳" + prouctname[index].price.toString(),
                                      style: TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          decorationThickness: 2.0,
                                          fontSize: hei / 50),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: RatingBarIndicator(
                                      rating: prouctname[index].rating,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 16.0,
                                      direction: Axis.horizontal,
                                    ),
                                  ),
                                  Text("[${prouctname[index].proprice}]")
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
