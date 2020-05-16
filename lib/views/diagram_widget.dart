import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:SUNMAX/helpers/utils.dart';
import 'package:SUNMAX/model/panel_model.dart';
import 'package:SUNMAX/model/log_model.dart';

class DiagramWidget extends StatelessWidget{
  final Panel panel;

  const DiagramWidget({Key key, this.panel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = getWidth(context);
    double h = getHeight(context);

    return FutureBuilder(
      future: panel != null ? getPanelTodayLogs(panel) : getAlllTodayLogs(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final logMaps = snapshot.data as List<Log>;

          var series = [
            charts.Series(
              id: 'Clicks',
              domainFn: (Log logData, _) => logData.time,
              measureFn: (Log logData, _) => logData.produced,
              colorFn: (Log logData, _) => charts.Color(r: 255, g: 255),
              data: logMaps,
            ),

            panel == null ?
            charts.Series(
              id: 'Clicks',
              domainFn: (Log logData, _) => logData.time,
              measureFn: (Log logData, _) => logData.produced,
              colorFn: (Log logData, _) => charts.Color(r: 255, g: 255),
              data: logMaps,
            ) : null,
          ];

          return Column(
            children: <Widget>[
              charts.LineChart<Log>(
                series,
                animate: false,
              )
            ]
          );
        }
        else {
          return Container();
        }
      },
    ) ;
  }
}
