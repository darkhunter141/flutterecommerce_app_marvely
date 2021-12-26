import 'package:flutter/material.dart';
import 'package:marvelyprojects/controlpanel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class custom_drawer extends StatefulWidget {

  @override
  State<custom_drawer> createState() => _custom_drawerState();
}

class _custom_drawerState extends State<custom_drawer> {
  int gender_value = 0;
  String name_value = "";


  @override
  void initState() {
    // TODO: implement initState
    showperfer();
  }

  @override
  showperfer() async {
    final showdata = await SharedPreferences.getInstance();
    setState(() {
      name_value = showdata.getString("name")!;
      gender_value = showdata.getInt("gender")!;
    });
  }

  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.topLeft,
      child: Drawer(
        child: Container(
          color: Color(0xFF505050),
          child: Column(
            children: [
              DrawerHeader(
                  child: Row(
                children: [
                  Container(
                    height: hei / 10,
                    width: hei / 10,
                    child: CircleAvatar(
                      radius: hei / 16,
                      backgroundColor: Color(0xFF505050),
                      backgroundImage: gender_value == 2
                          ? AssetImage('assets/female.png')
                          : AssetImage('assets/male.png'),
                    ),
                  ),
                  SizedBox(width: hei / 40),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: hei / 18),
                        Text(
                          "Welcome Guest",
                          style: TextStyle(
                              fontSize: hei / 34, color: Colors.white),
                        ),
                        Text(
                          "$name_value",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>main_controlpanel()));
                  },
                  leading:
                      Icon(Icons.home, size: hei / 24, color: Colors.white),
                  title: Text("Home",
                      style:
                          TextStyle(fontSize: hei / 34, color: Colors.white)),
                ),
              ),

              Padding(
                padding:EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {},
                  leading: Icon(Icons.shopping_cart,
                      size: hei / 24, color: Colors.white),
                  title: Text("My Orders",
                      style:
                          TextStyle(fontSize: hei / 34, color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {},
                  leading: Icon(Icons.notifications,
                      size: hei / 24, color: Colors.white),
                  title: Text("Notifications",
                      style:
                          TextStyle(fontSize: hei / 34, color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {},
                  leading: Icon(Icons.star_border,
                      size: hei / 24, color: Colors.white),
                  title: Text("Rate this appp",
                      style:
                          TextStyle(fontSize: hei / 34, color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {},
                  leading: Icon(Icons.call,
                      size: hei / 24, color: Colors.white),
                  title: Text("Contract Support",
                      style:
                      TextStyle(fontSize: hei / 34, color: Colors.white)),
                ),
              ),
              SizedBox(height: hei / 34),
              SizedBox(height: hei / 34),
              Text('''V 1.0(4)''',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
