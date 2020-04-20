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
      future: DBProvider.db.getOrders(user),

      builder: (context, snapshot){
        if (snapshot.hasData){
          final orderMaps = (snapshot.data as List)..sort((a,b) => b['id'] - a['id']);

          if (orderMaps.length > 0) {
            return SingleChildScrollView(
              child: Column(
                children: orderMaps.map((map) {
                  Order order = Order.fromMap(map);

                  return OrderWidget(
                    order: order,
                  );
                }).toList(),
              ),
            );
          }
          else {
            return Center(
              child: Text("Заказов пока нет"),
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