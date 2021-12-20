import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class notification extends StatefulWidget {
  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
  final _url = "http://ipwhois.app/json/27.123.254.138";
  var g_data = [];
  @override
  void initState() {
    getdata_database();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: g_data.length,
          itemBuilder: (context, index){
            final load = g_data[index];
            return Card(
              elevation: 20,
              child: ListTile(
                title: Text('Title : ${load['ip']}'),
              ),
            );
          }),
    );
  }

  getdata_database() async {
    try {
      final response = await http.get(Uri.parse(_url));
      final jsondata =response.body as List;

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
