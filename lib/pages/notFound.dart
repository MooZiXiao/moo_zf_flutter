import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('404'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Text(
          '您访问的页面不存在！'
        ),
      ),
    );
  }
}