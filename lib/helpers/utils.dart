import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/model/log_model.dart';
import 'package:flutterappweb/model/panel_model.dart';

double getWidth(BuildContext context) => MediaQuery.of(context).size.width;
double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

double formatDouble(double number, [int n = 0]){
  int a = (number * (10 ^ n)).round();
  double res = a / (10 ^ n);
  return res;
}

Future<List<Log>> getPanelHistoryLogs(Panel panel) async{
  List<Log> result = [];
  final logProducedMaps = await DBProvider.db.getHistoryProducedLogs(panel.userId);

  logProducedMaps.forEach((element) {
    Log log = Log.fromMap(element);

    if (log.panelId == panel.id) {
      result.add(log);
    }
  });
}