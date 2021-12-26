import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class admin_dashboard extends StatefulWidget {
  @override
  _admin_dashboardState createState() => _admin_dashboardState();
}

class _admin_dashboardState extends State<admin_dashboard> {

  TextEditingController product_id = TextEditingController();
  TextEditingController product_title = TextEditingController();
  TextEditingController product_categoty = TextEditingController();
  TextEditingController product_description = TextEditingController();
  TextEditingController product_price = TextEditingController();
  TextEditingController product_discount = TextEditingController();
  TextEditingController product_rating = TextEditingController();
  TextEditingController product_url = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Center(
                  child: Text(
                "Add Product",
                style: TextStyle(color: Colors.red, fontSize: 40),
              )),
              Text("\n"),
              Text("Product Title : \n",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 23)),
              TextField(
                controller: product_title,
                style: TextStyle(color: Colors.black, fontSize: 17),
                decoration: InputDecoration(
                    hintText: "Title",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange)),
                    border: OutlineInputBorder()),
              ),
              Text("\n"),
              Text("Product Category : \n",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 23)),
              TextField(
                controller: product_categoty,
                style: TextStyle(color: Colors.black, fontSize: 17),
                decoration: InputDecoration(
                    hintText: "Category",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange)),
                    border: OutlineInputBorder()),
              ),
              Text("\n"),
              Text("Product ID : \n",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 23)),
              TextField(
                controller: product_id,
                style: TextStyle(color: Colors.black, fontSize: 17),
                decoration: InputDecoration(
                    hintText: "ID",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange)),
                    border: OutlineInputBorder()),
              ),
              Text("\n"),
              Text("Product Description : \n",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 23)),
              TextField(
                controller: product_description,
                style: TextStyle(color: Colors.black, fontSize: 17),
                decoration: InputDecoration(
                    hintText: "Description",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange)),
                    border: OutlineInputBorder()),
              ),
              Text("\n"),
              Text("Product Price : \n",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 23)),
              TextField(
                controller: product_price,
                style: TextStyle(color: Colors.black, fontSize: 17),
                decoration: InputDecoration(
                    hintText: "Price",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange)),
                    border: OutlineInputBorder()),
              ),
              Text("\n"),
              Text("Product Discount : \n",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 23)),
              TextField(
                controller: product_discount,
                style: TextStyle(color: Colors.black, fontSize: 17),
                decoration: InputDecoration(
                    hintText: "Discount",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange)),
                    border: OutlineInputBorder()),
              ),
              Text("\n"),
              Text("Product Rating : \n",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 23)),
              TextField(
                controller: product_rating,
                style: TextStyle(color: Colors.black, fontSize: 17),
                decoration: InputDecoration(
                    hintText: "Rating",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange)),
                    border: OutlineInputBorder()),
              ),
              Text("\n"),
              Text("Product Img Url : \n",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 23)),
              TextField(
                controller: product_url,
                style: TextStyle(color: Colors.black, fontSize: 17),
                decoration: InputDecoration(
                    hintText: "URl",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange)),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 50), primary: Colors.red),
                    onPressed: () {
                      add_porduct();
                      product_url.clear();
                      product_rating.clear();
                      product_discount.clear();
                      product_id.clear();
                      product_categoty.clear();
                      product_price.clear();
                      product_description.clear();
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 20),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  add_porduct() async {
    try {
      final add_product = await http.get(Uri.parse(
          "http://127.0.0.1:3333/details/products/add/${product_id.text}-${product_url.text}-${product_title.text}-${product_description.text}-${product_rating.text}-${product_categoty.text}-${product_discount.text}-${product_price.text}"));
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Plese check your Internet connection",
          toastLength: Toast.LENGTH_LONG);
    }
  }
}
