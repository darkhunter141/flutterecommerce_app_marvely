import 'package:double_back_to_close/toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class about_developer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF505050),
        leading: Icon(Icons.arrow_back_outlined),
        title: Text("About Developer", style: TextStyle()),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 10),
            CircleAvatar(
              radius: 80,
              backgroundColor: Color(0xFF505050),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/male.png'),
              ),
            ),

            SizedBox(height: 20),
            Center(
                child: Text("Ashrafi Khandaker Abir",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold))),
            SizedBox(height: 20),
            Center(
                child: Text("Use your brain, Make google your friend😶",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold))),
            SizedBox(height:5),
            Center(
                child: Text("Nothing is perfect",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold))),
            SizedBox(height:5),
            Center(
                child: Text("All systems are weak",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold))),
            SizedBox(height:5),
            Center(
                child: Text("ಠ‿ಠ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold))),
            SizedBox(height:200),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      primary: Color(0xFF505050),
                      fixedSize: Size(200,50)),
                  onPressed: () {
                    Fluttertoast.showToast(msg: "Batch : 79");
                  },
                  child: Text("Batch Information", style: TextStyle(fontSize: 20))),
            )

          ],
        ),
      ),
    );
  }
}
