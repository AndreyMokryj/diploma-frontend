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
          final times = [
            '00',
            '01',
            '02',
            '03',
            '04',
            '05',
            '06',
            '07',
            '08',
            '09',
            '10',
            '11',
            '12',
            '13',
            '14',
            '15',
            '16',
            '17',
            '18',
            '19',
            '20',
            '21',
            '22',
            '23',
          ];
          var logMaps = snapshot.data as List<Log>;
//          logMaps.removeWhere((element) => element.produced == 0);

          times.forEach((time) {
            var logs = logMaps.where((element) => element.time.startsWith(time));
            if (logs.length == 0){
              Log newLog = Log(
                time: "${time}:00",
                produced: 0,
                given: 0,
              );
              logMaps.add(newLog);
            }
          });
          logMaps.sort((l1, l2) => l1.time.compareTo(l2.time));

          var series = [
            charts.Series(
              id: 'Produced',
              domainFn: (Log logData, _) => logData.time.substring(0, 2),
              measureFn: (Log logData, _) => logData.produced / 3600000,
              colorFn: (Log logData, _) => charts.Color(r: 255, g: 255, b: 0),
              data: logMaps,
            ),
          ];

          if(panel == null){
            series.add(charts.Series(
              id: 'Given',
              domainFn: (Log logData, _) => logData.time.substring(0, 2),
              measureFn: (Log logData, _) => logData.given / 3600000,
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
