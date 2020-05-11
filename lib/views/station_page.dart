import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/helpers/constants.dart';
import 'package:flutterappweb/helpers/utils.dart';
import 'package:flutterappweb/model/notifiers/login_notifier.dart';
import 'package:flutterappweb/model/user_model.dart';
import 'package:flutterappweb/model/accumulator_model.dart' as acc;
import 'package:flutterappweb/views/station_widget.dart';
import 'package:provider/provider.dart';

class StationPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<LoginNotifier>(context).user;
//    double w = getWidth(context);
//    int count = 1;
//    if (w >= smallLimit) {
//      count = 2;
//    }
////    if (w >= mediumLimit) {
////      count = 3;
////    }

    return FutureBuilder(
      future: DBProvider.db.getAccumulator(user.id),
      builder:(context, snapshot) {
        if (snapshot.hasData) {
          return StationWidget(
            accumulator: snapshot.data as acc.Accumulator,
          );
        }
        else {
          return Container();
        }
      }
    );
  }
}