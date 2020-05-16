import 'package:flutter/material.dart';
import 'package:SUNMAX/database/database.dart';
import 'package:SUNMAX/helpers/constants.dart';
import 'package:SUNMAX/helpers/utils.dart';
import 'package:SUNMAX/model/accumulator_model.dart' as acc;
import 'package:SUNMAX/views/history_widget.dart';
import 'package:SUNMAX/views/diagram_widget.dart';

class StationWidget extends StatefulWidget{
  final acc.Accumulator accumulator;

  const StationWidget({Key key, this.accumulator}) : super(key: key);

  @override
  _StationWidgetState createState() => _StationWidgetState();
}

class _StationWidgetState extends State<StationWidget> {
  acc.Accumulator _accumulator;
  bool showHistory;

  @override
  void initState() {
    _accumulator = widget.accumulator;
    showHistory = false;
    super.initState();
  }

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

    return SingleChildScrollView(
      child: Container(
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
                  child: FlatButton(
                    child: Image.asset(
                      _accumulator.stationConnection == 1 ? "assets/images/switch/h_switch_on.png" : "assets/images/switch/h_switch_off.png",
                    ),
                    onPressed: () async {
                      _accumulator.stationConnection = 1 - _accumulator.stationConnection;
                      await DBProvider.db.switchStation(_accumulator);
                      setState(() {
                        _accumulator = _accumulator;
                      });
                    },
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
                  child: FlatButton(
                    child: Image.asset(
                      _accumulator.gridConnection == 1 ? "assets/images/switch/h_switch_on.png" : "assets/images/switch/h_switch_off.png",
                    ),
                    onPressed: () async {
                      _accumulator.gridConnection = 1 - _accumulator.gridConnection;
                      await DBProvider.db.switchGrid(_accumulator);

                      setState(() {
                        _accumulator = _accumulator;
                      });
                    },
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
            DiagramWidget(),

            SizedBox(
              height: 30,
            ),

            HistoryWidget(),
          ],
        ),
      ),
    );
  }
}