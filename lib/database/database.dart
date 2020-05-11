import 'dart:convert';
import 'package:flutterappweb/helpers/constants.dart';
import 'package:flutterappweb/model/panel_model.dart';
import 'package:flutterappweb/model/user_model.dart' as u;
import 'package:http/http.dart' as http;

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Future<bool> newUser(u.User user) async {
    final response = await http.post(
      "${baseUrl}users/",
      body: jsonEncode(user.toMap()),
      headers: {
        'content-type': 'application/json'
      }
    );

    final responseBody = jsonDecode(response.body);
    return responseBody;
  }

  Future<u.User> checkUser(u.User user) async {
    final response = await http.post(
      "${baseUrl}users/check/",
      body: jsonEncode(user.toMap()),
      headers: {
        'content-type': 'application/json'
      }
    );

    final responseBody = jsonDecode(response.body);
    return u.User.fromMap(responseBody);
  }

  Future<List> getPanels(u.User user) async {
    final response = await http.get(
      "${baseUrl}panels/userId/${user.id}",
      headers: {
        'content-type': 'application/json'
      }
    );

    final responseBody = jsonDecode(response.body);
    return responseBody;
  }

  Future<Panel> getPanel(String panelId, String userId) async {
    final response = await http.get(
      "${baseUrl}panels/${panelId}/userId/${userId}",
      headers: {
        'content-type': 'application/json'
      }
    );

    final responseBody = jsonDecode(response.body);
    return Panel.fromMap(responseBody);
  }
}