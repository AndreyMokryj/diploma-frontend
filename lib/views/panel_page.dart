import 'package:SUNMAX/database/database.dart';
import 'package:SUNMAX/views/power_widget.dart';
import 'package:flutter/material.dart';
import 'package:SUNMAX/helpers/utils.dart';
import 'package:SUNMAX/model/panel_model.dart';
import 'package:SUNMAX/views/history_widget.dart';
import 'package:SUNMAX/views/diagram_widget.dart';

class PanelPage extends StatefulWidget{
  final Panel panel;

  const PanelPage({Key key, this.panel}) : super(key: key);

  @override
  _PanelPageState createState() => _PanelPageState();
}

class _PanelPageState extends State<PanelPage> {
  Panel _panel;

  @override
  void initState() {
    _panel = widget.panel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = getWidth(context);
    double h = getHeight(context);

    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Назва панелі:"),
              SizedBox(
                width: 30,
              ),
              Text("${widget.panel.name}"),
//              SizedBox(
//                width: 30,
//              ),
//              PowerWidget(
//                panel: widget.panel,
//              )
            ],
          ),
          Row(
            children: <Widget>[
              Text("Модель панелі:"),
              SizedBox(
                width: 30,
              ),
              Text("${widget.panel.model}"),
            ],
          ),
          Row(
            children: <Widget>[
              Text("Номінальна потужність:"),
              SizedBox(
                width: 30,
              ),
              Text("${widget.panel.nominalPower} W"),
            ],
          ),
          Row(
            children: <Widget>[
              Text("Поточна потужність:"),
              SizedBox(
                width: 30,
              ),
              PowerWidget(
                panel: _panel,
              ),
              Text(" W"),
            ],
          ),
          Row(
            children: <Widget>[
              Text("Статус:"),
              SizedBox(
                width: 30,
              ),
              Text(
                _panel.connected == 1 ? "Підключено" : "Відключено",
                style: TextStyle(
                  color: _panel.connected == 1 ? Colors.green : Colors.red,
                ),
              ),
              Switch(
                value: _panel.connected == 1,
                onChanged: (val) async {
                  _panel.connected = val ? 1 : 0;
                  bool s = await DBProvider.db.switchPanel(_panel);
                  if (s){
                    setState(() {
                      _panel = _panel;
                    });
                  }
                },
              ),
            ],
          ),

          SizedBox(
            height: 30,
          ),
          DiagramWidget(
            panel: widget.panel,
          ),
          SizedBox(
            height: 30,
          ),

          HistoryWidget(
            panel: widget.panel,
          )
        ],
      ),
    );
  }
}
