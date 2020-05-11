import 'package:flutter/material.dart';
import 'package:flutterappweb/helpers/constants.dart';
import 'package:flutterappweb/helpers/utils.dart';
import 'package:flutterappweb/model/panel_model.dart';

class PanelWidget extends StatelessWidget{
  final Panel panel;

  const PanelWidget({Key key, this.panel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = getWidth(context);
    double h = getHeight(context);

//    return SingleChildScrollView(
//      padding: EdgeInsets.all(20),
//      child: Column(
//        children: <Widget>[
//          Container(
//            padding: EdgeInsets.all(1),
//            height: w > smallLimit ? h * 0.8 : null,
//            width: w > smallLimit ? null : w * 0.9,
//
//          ),
//
//          SizedBox(
//            height: 20,
//          ),
//
//          SizedBox(
//            height: 30,
//          ),
//
//        ],
//      ),
//    );

    return Container(
      height: 30,
      margin: EdgeInsets.all(4),
      color: panel.connected == 1 ? Colors.green : Colors.red,
      child: FlatButton(
        onPressed: (){
          Navigator.of(context).pushNamed("/details/${panel.id}");
        },
      ),
    );
  }
}
