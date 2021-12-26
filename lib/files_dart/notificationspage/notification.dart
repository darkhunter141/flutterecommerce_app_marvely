import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class notification extends StatefulWidget {
  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
  final _url = "https://raw.githubusercontent.com/ashrafiabir01/databse_test/main/notification.json";
  var g_data = [];
  @override
  void initState() {
    getdata_database();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFF505050),
        title: Text("Notifications"),
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 10,left: 10,right: 10),
        child: ListView.builder(
            itemCount: g_data.length,
            itemBuilder: (context, index){
              final load = g_data[index];
              return Card(
                elevation: 20,
                child: ListTile(
                  leading: CircleAvatar(child: Icon(Icons.notifications)),
                  title: Text('${load['title']}',style: TextStyle(
                    fontSize: 20,color: Colors.blue
                  ),),
                  subtitle:Text('${load['subtitle']}',style: TextStyle(
                      fontSize: 20, color: Color(0xFF505050),
                  ),),
                ),
              );
            }),
      ),
    );
  }

  getdata_database() async {
    try {
      final response = await http.get(Uri.parse(_url));
      final jsondata =jsonDecode(response.body) as List;

      setState(() {
        g_data = jsondata;
      });
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Plese check your Internet connection",
          toastLength: Toast.LENGTH_LONG);
    }
  }
}
