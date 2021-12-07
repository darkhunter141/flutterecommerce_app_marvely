import 'package:marvelyprojects/files_dart/profiles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage_app extends StatefulWidget {
  @override
  State<homepage_app> createState() => _homepage_appState();
}

class _homepage_appState extends State<homepage_app> {
  @override
  void initState() {
    // TODO: implement initState
    setpageopen();
  }
  @override
  setpageopen() async {
    final preferset = await SharedPreferences.getInstance();
    preferset.setBool("pagedecidevalue",true);
  }
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: hei/5),
              Text(
                "Nais Bro",
                style: TextStyle(color: Colors.black, fontSize: hei / 10),
              ),
              Image.asset("assets/clap.gf.gif",fit: BoxFit.fill,),  SizedBox(
                height: hei/15,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 30),
                  child: Container(
                    height: hei / 15,
                    width: hei/3,
                    decoration: BoxDecoration(
                      color: Color(0xFF505050),
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>profile()));
                        },
                        child: Text(
                          "Profile",
                          style: TextStyle(
                              color: Colors.white, fontSize: hei / 37),
                        )),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
