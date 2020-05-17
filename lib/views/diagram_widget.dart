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

          var list = [0];
          if (panel == null) {
            list.add(1);
          }

          var series = list.map((e) =>
            ColumnSeries<Log, String>(
              dataSource: logMaps,
              xValueMapper: (Log log, _) => log.time.substring(0, 2),
              yValueMapper: (Log log, _) =>
              e == 0
                ? log.produced / 3600000
                : log.given / 3600000,
              legendItemText: legendItems[e]['title'],
              color: legendItems[e]['color'],
            )).toList();

          return Column(
            children: <Widget>[
              Text("Виробіток сьогодні:"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: w < mediumLimit ? mediumLimit * 1.0 :
                  (w < largeLimit ? w * 0.95 : w * 0.75),
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(
                      title: AxisTitle(
                        text: 'кВат * год',
                      )
                    ),
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
                children: legendItems.map((el) =>
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          left: 20,
                          right: 20,
                        ),
                        width: 20,
                        height: 20,
                        color: el['color'],
                      ),
                      Text(el['title'])
                    ],
                  )).toList()
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
