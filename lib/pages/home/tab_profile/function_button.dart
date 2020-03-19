import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/pages/home/tab_profile/function_button_item_data.dart';
import 'package:moo_zf_flutter/pages/home/tab_profile/function_button_item_widget.dart';

class FunctionButton extends StatefulWidget {
  @override
  _FunctionButtonState createState() => _FunctionButtonState();
}

class _FunctionButtonState extends State<FunctionButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 1.0,
        runSpacing: 1.0,
        children: list.map((item) => 
          FunctionButtonItemWidget(item)
        ).toList(),
      ),
    );
  }
}