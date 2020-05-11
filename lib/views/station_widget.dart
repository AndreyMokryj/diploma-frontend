import 'package:flutter/material.dart';
import 'package:flutterappweb/helpers/constants.dart';
import 'package:flutterappweb/helpers/utils.dart';
import 'package:flutterappweb/model/accumulator_model.dart' as acc;

class StationWidget extends StatefulWidget{
  final acc.Accumulator accumulator;

  const StationWidget({Key key, this.accumulator}) : super(key: key);

  @override
  _StationWidgetState createState() => _StationWidgetState();
}

class _StationWidgetState extends State<StationWidget> {
  @override
  Widget build(BuildContext context) {
    double w = getWidth(context);
    int count = 1;
    if (w >= smallLimit) {
      count = 2;
    }
//    if (w >= mediumLimit) {
//      count = 3;
//    }

    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Image.asset(
                  "assets/images/panels.png",
                ),
              ),
              Container(
                width: 2,
                height: 20,
                color: Colors.black,
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/switch/h_switch_on.png",
                ),
              ),
              Container(
                width: 2,
                height: 20,
                color: Colors.black,
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/accumulator.png",
                ),
              ),
              Container(
                width: 2,
                height: 20,
                color: Colors.black,
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/switch/h_switch_on.png",
                ),
              ),
              Container(
                width: 2,
                height: 20,
                color: Colors.black,
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/grid.png",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}