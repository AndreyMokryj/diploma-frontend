import 'package:SUNMAX/views/diagram_widget.dart';
import 'package:SUNMAX/views/history_widget.dart';
import 'package:SUNMAX/views/power_widget.dart';
import 'package:flutter/material.dart';
import 'package:SUNMAX/database/database.dart';
import 'package:SUNMAX/model/notifiers/login_notifier.dart';
import 'package:SUNMAX/model/user_model.dart';
import 'package:SUNMAX/model/accumulator_model.dart' as acc;
import 'package:SUNMAX/views/station_widget.dart';
import 'package:provider/provider.dart';

class StationPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<LoginNotifier>(context).user;

    return FutureBuilder(
      future: DBProvider.db.getAccumulator(user.id),
      builder:(context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text("Моя станція"),
                  StationWidget(
                    accumulator: snapshot.data as acc.Accumulator,
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("Поточна потужність:"),
                      SizedBox(
                        width: 20,
                      ),
                      PowerWidget(),
                      Text(" W"),
                    ],
                  ),

                  SizedBox(
                    height: 30,
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
        else {
          return Container();
        }
      }
    );
  }
}