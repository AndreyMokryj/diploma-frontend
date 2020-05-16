import 'package:flutter/material.dart';
import 'package:SUNMAX/helpers/utils.dart';
import 'package:SUNMAX/model/panel_model.dart';
import 'package:SUNMAX/views/history_widget.dart';
import 'package:SUNMAX/views/diagram_widget.dart';

import 'diagram_widget.dart';

class PanelPage extends StatelessWidget{
  final Panel panel;

  const PanelPage({Key key, this.panel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = getWidth(context);
    double h = getHeight(context);

    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          DiagramWidget(
            panel: panel,
          ),
          SizedBox(
            height: 30,
          ),

          HistoryWidget(
            panel: panel,
          )
        ],
      ),
    );
  }
}
