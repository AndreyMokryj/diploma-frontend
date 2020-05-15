import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/helpers/utils.dart';
import 'package:flutterappweb/model/panel_model.dart';

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
//      height: 30,
      margin: EdgeInsets.all(4),
//      color: panel.connected == 1 ? Colors.green : Colors.red,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                FlatButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed("/details/${widget.panel.id}");
                  },
                ),
              ],
            ),
          ),
//          Expanded(
//            child:
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
//          )
        ],
      ),
    );
  }
}
