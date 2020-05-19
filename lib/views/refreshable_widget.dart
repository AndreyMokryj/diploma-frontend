import 'dart:async';

import 'package:SUNMAX/helpers/constants.dart';
import 'package:flutter/material.dart';

class RefreshableWidget extends StatefulWidget{
  final Widget child;

  const RefreshableWidget({Key key, this.child}) : super(key: key);

  @override
  _RefreshableWidgetState createState() => _RefreshableWidgetState();
}

class _RefreshableWidgetState extends State<RefreshableWidget> {
  Timer _timer;

  @override
  void initState() {
    _timer = new Timer.periodic(refreshRate,
        (Timer timer) {
        setState(() {});
        widget.createState();
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
    return widget.child;
  }
}
