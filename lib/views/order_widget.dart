import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/model/order_model.dart';
import 'package:flutterappweb/views/order_buttons.dart';

class OrderWidget extends StatefulWidget{
  final Order order;

  const OrderWidget({Key key, this.order}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OrderWidgetState();
  }

}

class _OrderWidgetState extends State<OrderWidget> {
  Order order;

  @override
  void initState() {
    order = widget.order;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Text('Заказ #${order.id} - ${order.placeIds
              .length} билета(ов) на сумму ${order.sum} грн.'),
          ),
        ),

        order.status == 0 ?
        OrderButtons(
          buttons: <Widget>[
            FlatButton(
              color: Colors.green,
              padding: EdgeInsets.zero,
              child: Text('Оплатить'),
              onPressed: _payOrder,
            ),
            SizedBox(
              width: 3,
              height: 3,
            ),
            FlatButton(
              color: Colors.red,
              padding: EdgeInsets.zero,
              child: Text('Отменить'),
              onPressed: _cancelOrder,
            ),
          ],
        )
        : Text(
          order.status == 1 ? "Оплачен" : "Отменен",
          style: TextStyle(
            color: order.status == 1 ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }


  void _payOrder() async{
    bool s = await DBProvider.db.payOrder(order);
    if (s){
      order.status = 1;
    }
    setState(() {
      order = order;
    });
  }

  void _cancelOrder() async {
    bool s = await DBProvider.db.cancelOrder(order);
    if (s){
      order.status = -1;
    }
    setState(() {
      order = order;
    });
  }
}

enum OrderStatus{PAID, UNPAID, CANCELLED}