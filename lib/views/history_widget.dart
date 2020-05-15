import 'package:flutter/material.dart';
import 'package:flutterappweb/helpers/constants.dart';
import 'package:flutterappweb/helpers/utils.dart';
import 'package:flutterappweb/model/panel_model.dart';

class HistoryWidget extends StatelessWidget{
  final Panel panel;

  const HistoryWidget({Key key, this.panel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = getWidth(context);
    double h = getHeight(context);

    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(1),
            height: w > smallLimit ? h * 0.8 : null,
            width: w > smallLimit ? null : w * 0.9,

          ),

          SizedBox(
            height: 20,
          ),

          SizedBox(
            height: 30,
          ),

        ],
      ),
    );
  }
}
