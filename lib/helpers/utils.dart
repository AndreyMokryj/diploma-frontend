import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/model/log_model.dart';
import 'package:flutterappweb/model/notifiers/login_notifier.dart';
import 'package:flutterappweb/model/panel_model.dart';
import 'package:provider/provider.dart';

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

  return result;
}

Future<List<Log>> getPanelTodayLogs(Panel panel) async{
  List<Log> result = [];
  final logProducedMaps = await DBProvider.db.getTodayProducedLogs(panel.userId);

  logProducedMaps.forEach((element) {
    Log log = Log.fromMap(element);

    if (log.panelId == panel.id) {
      result.add(log);
    }
  });

  return result;
}

Future<List<Log>> getAlllHistoryLogs(BuildContext context) async{
  List<Log> result = [];

  final user = Provider.of<LoginNotifier>(context, listen: false).user;
  final logProducedMaps = await DBProvider.db.getHistoryProducedLogs(user.id);
  final logGivenMaps = await DBProvider.db.getHistoryGivenLogs(user.id);

  for(Map element in logGivenMaps) {
    Log resultLog = Log.fromMap(element);
    resultLog.produced = 0;

    for(Map map in logProducedMaps){
      Log log = Log.fromMap(map);
      if(log.date == resultLog.date){
        resultLog.produced = resultLog.produced + log.produced;
      }
    }

    result.add(resultLog);
  };

  return result;
}

Future<List<Log>> getAlllTodayLogs(BuildContext context) async{
  List<Log> result = [];

  final user = Provider.of<LoginNotifier>(context, listen: false).user;
  final logProducedMaps = await DBProvider.db.getTodayProducedLogs(user.id);
  final logGivenMaps = await DBProvider.db.getTodayGivenLogs(user.id);

  logGivenMaps.forEach((element) {
    Log resultLog = Log.fromMap(element);
    resultLog.produced = 0;

    for(Map map in logProducedMaps){
      Log log = Log.fromMap(map);
      if(log.time == resultLog.time){
        resultLog.produced += log.produced;
      }
    }

    result.add(resultLog);
  });

  return result;
}