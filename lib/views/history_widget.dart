import 'package:flutter/material.dart';
import 'package:flutterappweb/helpers/constants.dart';
import 'package:flutterappweb/helpers/utils.dart';
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
            onTap: (){
              setState(() {
                showHistory = !showHistory;
              });
            },
          ),
        ),
        showHistory ? Container(
          height: 40,
          color: Colors.blue,
        ) : Container(),

      ],
    );
  }
}
