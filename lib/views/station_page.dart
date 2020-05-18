import 'package:SUNMAX/helpers/utils.dart';
import 'package:SUNMAX/views/diagram_widget.dart';
import 'package:SUNMAX/views/history_widget.dart';
import 'package:SUNMAX/views/refreshable_number_widget.dart';
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
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text("Моя станція")
                  ),
                  StationWidget(
                    accumulator: snapshot.data as acc.Accumulator,
                  ),
                  
                  SizedBox(
                    height: 10,
                  ),
                  
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("Поточна потужність:"),
                      SizedBox(
                        width: 20,
                      ),
                      RefreshableNumberWidget(
                        future: getRequiredPower,
                      ),
                      Text(" W"),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("Вироблено з початку дня:"),
                      SizedBox(
                        width: 20,
                      ),
                      RefreshableNumberWidget(
                        future: getTodayProducedEnergy,
                      ),
                      Text(" кВат * год"),
                    ],
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("Продано з початку дня:"),
                      SizedBox(
                        width: 20,
                      ),
                      RefreshableNumberWidget(
                        future: getTodayGivenEnergy,
                      ),
                      Text(" кВат * год"),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),

                  DiagramWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),

                  HistoryWidget(),
                  Divider(),
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