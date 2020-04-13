import 'package:flutter/material.dart';
import 'package:flutterappweb/helpers/constants.dart';
import 'package:flutterappweb/helpers/utils.dart';

class OrderButtons extends StatelessWidget{
  final List<Widget> buttons;

  const OrderButtons({Key key, this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = getWidth(context);

    return Container(
      child: w > smallLimit ? Row(
        children: buttons,
      )
      : Column(
        children: buttons,
      ),
    );
  }
}