import 'package:SUNMAX/helpers/constants.dart';
import 'package:SUNMAX/helpers/styles.dart';
import 'package:SUNMAX/views/refreshable_number_widget.dart';
import 'package:flutter/material.dart';
import 'package:SUNMAX/database/database.dart';
import 'package:SUNMAX/helpers/utils.dart';
import 'package:SUNMAX/model/panel_model.dart';

class PanelWidget extends StatefulWidget{
  final Panel panel;

  const PanelWidget({Key key, this.panel}) : super(key: key);

  @override
  _PanelWidgetState createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
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

    return Container(
      margin: EdgeInsets.all(4),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("${_panel.name}"),
                    SizedBox(
                      width: 30,
                    ),
                    RefreshableNumberWidget(
                      future: getRequiredPower,
                      panel: _panel,
                    ),
                    Text(" W"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  _panel.model,
                  style: lightTextStyle,
                ),
                Text(
                  "${_panel.nominalPower} W",
                  style: lightTextStyle,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 5,
                    left: 10,
                    bottom: 5,
                  ),
                  child: FlatButton(
//                  color: buttonColor,
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
//                    side: BorderSide(
//                      width: 2,
//                      color: buttonColor,
//                    )
                    ),
                    child: Text(
                      "Деталі",
                      style: TextStyle(
//                      color: buttonColor,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: (){
                      Navigator.of(context).pushNamed("/details/${widget.panel.id}");
                    },
                  ),
                ),
              ],
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
    );
  }
}
