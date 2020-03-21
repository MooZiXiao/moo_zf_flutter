import 'package:flutter/material.dart';

class CommonTitle extends StatelessWidget {
  final String title;
  CommonTitle(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: EdgeInsets.only(left: 10.0),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}