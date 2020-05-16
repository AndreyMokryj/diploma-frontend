import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/helpers/constants.dart';
import 'package:flutterappweb/helpers/utils.dart';
import 'package:flutterappweb/model/log_model.dart';
import 'package:flutterappweb/model/panel_model.dart';

class HistoryWidget extends StatefulWidget{
  final Panel panel;

  const HistoryWidget({Key key, this.panel}) : super(key: key);

  @override
  _HistoryWidgetState createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  bool showHistory;

  @override
  void initState() {
    showHistory = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = getWidth(context);
    double h = getHeight(context);

    return Column(
      children: <Widget>[
        Container(
          child: ListTile(
            leading: Icon(
              showHistory ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            ),
            title: Text("Історія"),
            onTap: () {
              setState(() {
                showHistory = !showHistory;
              });
            },
          ),
        ),
        showHistory ? FutureBuilder(
//          future: widget.panel != null ? DBProvider.db.getPanelHistoryLogs(
          future: widget.panel != null ? null : null,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final logMaps = snapshot.data as List;
//              return Container(
//                height: 40,
//                color: Colors.blue,
//              );
              return Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Дата"),
                      ),
                      Container(
                        width: 2,
                        color: Colors.black,
                      ),
                      Expanded(
                        child: Text("Вироблено енергії, кВт-год"),
                      ),
                      widget.panel == null
                        ? Row(
                        children: <Widget>[
                          Container(
                            width: 2,
                            color: Colors.black,
                          ),
                          Expanded(
                            child: Text("Продано енергії, кВт-год"),
                          ),
                        ],
                      )
                        : Container(),
                    ],
                  ),
                ] +
                  logMaps.map((e) {
                    final log = Log.fromMap(e);
                    return Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(log.date),
                        ),
                        Container(
                          width: 2,
                          color: Colors.black,
                        ),
                        Expanded(
                          child: Text("${formatDouble(log.produced / 3600000, 2)}"),
                        ),
                        widget.panel == null
                          ? Row(
                          children: <Widget>[
                            Container(
                              width: 2,
                              color: Colors.black,
                            ),
                            Expanded(
                              child: Text("${formatDouble(log.given / 3600000, 2)}"),
                            ),
                          ],
                        )
                          : Container(),
                      ],
                    );
                  }
                  ).toList(),
              );
            }
            else {
              return Container();
            }
          },
        ) : Container(),
      ],
    );
  }
}
