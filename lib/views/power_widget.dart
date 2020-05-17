import 'dart:async';

import 'package:flutter/material.dart';
import 'package:SUNMAX/helpers/utils.dart';
import 'package:SUNMAX/model/panel_model.dart';
import 'package:SUNMAX/helpers/constants.dart';

class PowerWidget extends StatefulWidget {
  final Panel panel;

  const PowerWidget({Key key, this.panel}) : super(key: key);

  @override
  _PowerWidgetState createState() => _PowerWidgetState();
}

class _PowerWidgetState extends State<PowerWidget> {
  Timer _timer;

  @override
  void initState() {
    _timer = new Timer.periodic(refreshRate,
        (Timer timer)async {
          setState(() {});
        });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = getWidth(context);
    double h = getHeight(context);
    Future future = getRequiredPower(context, panel: widget.panel);

    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text("${snapshot.data}");
        }
        return Container();
      }
    );
  }
}
