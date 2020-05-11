import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/helpers/constants.dart';
import 'package:flutterappweb/helpers/utils.dart';
import 'package:flutterappweb/model/accumulator_model.dart' as acc;
import 'package:flutterappweb/model/notifiers/login_notifier.dart';
import 'package:flutterappweb/model/user_model.dart';
import 'package:provider/provider.dart';

class StationWidget extends StatefulWidget{
  final acc.Accumulator accumulator;

  const StationWidget({Key key, this.accumulator}) : super(key: key);

  @override
  _StationWidgetState createState() => _StationWidgetState();
}

class _StationWidgetState extends State<StationWidget> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<LoginNotifier>(context).user;
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
            children: <Widget>[
              Expanded(
                child: Image.asset(
                  "assets/images/panels.png",
                ),
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/switch/h_switch_on.png",
                ),
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/accumulator.png",
                ),
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/switch/h_switch_on.png",
                ),
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