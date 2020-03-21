import 'package:flutter/material.dart';

class CommonFloatingActionButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const CommonFloatingActionButton(this.title, this.onTap, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(null != onTap) onTap();
      },
      child: Container(
        height: 40.0,
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      ),
    );
  }
}