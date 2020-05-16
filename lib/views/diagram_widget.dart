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
              id: 'Produced',
              domainFn: (Log logData, _) => logData.time,
              measureFn: (Log logData, _) => logData.produced,
              colorFn: (Log logData, _) => charts.Color(r: 255, g: 255, b: 0),
              data: logMaps,
            ),

//            panel == null ?
//            charts.Series(
//              id: 'Given',
//              domainFn: (Log logData, _) => logData.time,
//              measureFn: (Log logData, _) => logData.given,
//              colorFn: (Log logData, _) => charts.Color(r: 255, g: 255),
//              data: logMaps,
//            ) : null,
          ];

          if(panel == null){
            series.add(charts.Series(
              id: 'Given',
              domainFn: (Log logData, _) => logData.time,
              measureFn: (Log logData, _) => logData.given,
              colorFn: (Log logData, _) => charts.Color(r: 0, g: 255, b: 0),
              data: logMaps,
            ));
          }

          return Container(
            height: h / 2,
            child: charts.BarChart(
              series,
              animate: false,
            ),
          );
        }
        else {
          return Container();
        }
      },
    ) ;
  }
}
