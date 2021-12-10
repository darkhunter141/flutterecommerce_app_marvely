import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key, key})
      : preferredSize = Size.fromHeight(60.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return AppBar(
      elevation: 0,
      backgroundColor: Color(0xFF505050),
      title: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7), color: Colors.white),
          height: hei / 23,
          width: wid / 1,
          child: Row(
            //crossAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search,
                size: hei / 24,
                color: Colors.black12,
              ),
              Text(
                "  nais product",
                style: TextStyle(
                  color: Colors.black12,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 7),
          child: Icon(Icons.qr_code, size: hei / 23),
        )
      ],
    );
  }
}
