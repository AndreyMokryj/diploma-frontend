import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/model/notifiers/login_notifier.dart';
import 'package:flutterappweb/model/order_model.dart';
import 'package:flutterappweb/model/user_model.dart';
import 'package:flutterappweb/views/order_widget.dart';
import 'package:provider/provider.dart';

class PanelsList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<LoginNotifier>(context, listen: false).user;

    return FutureBuilder(
      future: DBProvider.db.getPanels(user),

      builder: (context, snapshot){
        if (snapshot.hasData){
          final panelMaps = (snapshot.data as List);

          if (panelMaps.length > 0) {
            return SingleChildScrollView(
              child: Column(
                children: panelMaps.map((map) {
//                  Order order = Order.fromMap(map);
//
//                  return OrderWidget(
//                    order: order,
//                  );
                  return Container(
                    height: 30,
                    margin: EdgeInsets.all(4),
                    color: Colors.green,
                  );
                }).toList(),
              ),
            );
          }
          else {
            return Center(
              child: Text("Немає панелей"),
            );
          }
        }
        else{
          return Container();
        }
      },
    );
  }
}