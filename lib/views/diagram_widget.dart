import 'package:flutter/material.dart';
import 'package:SUNMAX/helpers/utils.dart';
import 'package:SUNMAX/model/panel_model.dart';

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
          final logMaps = snapshot.data as List;
//              return Container(
//                height: 40,
//                color: Colors.blue,
//              );
          return Column(
            children: <Widget>[

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
