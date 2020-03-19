import 'package:flutter/material.dart';

class CommonTag extends StatelessWidget {
  final String title;
  final Color color;
  final Color backgroundColor;

  const CommonTag.origin(this.title, {Key key, this.color = Colors.white, this.backgroundColor = Colors.lightBlueAccent}) : super(key: key);

  factory CommonTag (String title) {
    switch(title) {
      case '近地铁':
       return CommonTag.origin(title, color: Colors.blue, backgroundColor: Colors.blue[100],);
      case '集中供暖':
       return CommonTag.origin(title, color: Colors.red, backgroundColor: Colors.red[100],);
      case '随时看房':
       return CommonTag.origin(title, color: Colors.green, backgroundColor: Colors.green[100],);
      case '新上':
       return CommonTag.origin(title, color: Colors.orange, backgroundColor: Colors.orange[100],);
      default: 
        return CommonTag.origin(title);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4.0),
      padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 10.0
        ),
      ),
    );
  }
}