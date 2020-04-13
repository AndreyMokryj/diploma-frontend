import 'package:flutter/material.dart';
import 'package:flutterappweb/helpers/constants.dart';
import 'package:flutterappweb/helpers/utils.dart';
import 'package:flutterappweb/model/notifiers/login_notifier.dart';
import 'package:provider/provider.dart';

class MenuWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double w = getWidth(context);

    return Container(
      color: Color.fromRGBO(180, 180, 180, 1),
      child: ListView(
        children: <Widget>[
          w <= largeLimit ? Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.menu),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ) : Container(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Главная"),
            onTap: (){
              Navigator.of(context).pushNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Корзина"),
            onTap: (){
              Navigator.of(context).pushNamed('/cart');
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Выход"),
            onTap: (){
              Provider.of<LoginNotifier>(context, listen: false).logOut();
              Navigator.of(context).pushNamed('/login');            },
          ),
        ],
      ),
    );
  }
}