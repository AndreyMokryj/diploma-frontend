import 'dart:math';

import 'package:flutter/material.dart';
import 'package:SUNMAX/helpers/utils.dart';
import 'package:SUNMAX/model/panel_model.dart';
import 'package:SUNMAX/model/log_model.dart';
import 'package:SUNMAX/helpers/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DiagramWidget extends StatelessWidget {
  final Panel panel;

  const DiagramWidget({Key key, this.panel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = getWidth(context);
    double h = getHeight(context);

    return FutureBuilder(
      future: panel != null ? getPanelTodayLogs(panel) : getAlllTodayLogs(
        context),
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

          times.forEach((time) {
            var logs = logMaps.where((element) =>
              element.time.startsWith(time));
            if (logs.length == 0) {
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
            ColumnSeries<Log, String>(
              dataSource: logMaps,
              xValueMapper: (Log log, _) => log.time.substring(0, 2),
              yValueMapper: (Log log, _) => log.produced / 3600000,
              legendItemText: "Вироблено",
              color: Colors.green,
            )
          ];

          if (panel == null) {
            series.add(ColumnSeries<Log, String>(
              dataSource: logMaps,
              xValueMapper: (Log log, _) => log.time.substring(0, 2),
              yValueMapper: (Log log, _) => log.given / 3600000,
              legendItemText: "Продано",
              color: Colors.orange,
            ));
          }

          return Column(
            children: <Widget>[
              Text("Виробіток сьогодні:"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: max(w, mediumLimit * 1.0),
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
//                      title: AxisTitle(
//                        text: 'Час',
//                      )
                    ),
                    primaryYAxis: NumericAxis(
                      title: AxisTitle(
                        text: 'кВат * год',
                      )
                    ),
//                title: ChartTitle(text: 'Виробіток сьогодні:'),
                    legend: Legend(isVisible: w >= mediumLimit),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: series,
                  )
                ),
              ),
              Text("Час"),
              SizedBox(
                height: 10,
              ),
              w < mediumLimit ? Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Вироблено")
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Продано")
                    ],
                  )
                ],
              ) : Container(),
            ],
          );
        }
        else {
          return Container();
        }
      },
    );
  }
}
