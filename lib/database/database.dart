import 'dart:convert';
import 'package:flutterappweb/helpers/constants.dart';
import 'package:flutterappweb/model/movie_model.dart';
import 'package:flutterappweb/model/order_model.dart';
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

//  Future<bool> checkUser(u.User user) async {
//    final response = await http.post(
//      "${baseUrl}users/check/",
//      body: jsonEncode(user.toMap()),
//      headers: {
//        'content-type': 'application/json'
//      }
//    );
//
//    final responseBody = jsonDecode(response.body);
//    return responseBody;
//  }

  Future<List> getPanels(u.User user) async {
    final response = await http.get(
      "${baseUrl}panels/userId/${user.id}",
//      body: jsonEncode(user.toMap()),
      headers: {
        'content-type': 'application/json'
      }
    );

    final responseBody = jsonDecode(response.body);
    return responseBody;
  }

  Future<List> getMovies() async {
    final response = await http.get(
      "${baseUrl}movies/",
      headers: {
        'content-type': 'application/json'
      }
    );

    final responseBody = jsonDecode(response.body);
    return responseBody;
  }

  Future<Movie> getMovie(int id) async {
    final response = await http.get(
      "${baseUrl}movies/$id",
      headers: {
        'content-type': 'application/json'
      }
    );

    final responseBody = jsonDecode(response.body);
    return Movie.fromMap(responseBody);
  }

  Future<List> getSessions(int movieId) async {
    final response = await http.get(
      "${baseUrl}sessions/mid/$movieId",
      headers: {
        'content-type': 'application/json'
      }
    );

    final responseBody = jsonDecode(response.body);
    return responseBody;
  }

  Future<List> getPlaces(int sessionId) async {
    final response = await http.get(
      "${baseUrl}places/sid/$sessionId",
      headers: {
        'content-type': 'application/json'
      }
    );

    final responseBody = jsonDecode(response.body);
    return responseBody;
  }

  Future<List> getPlacesForUser(u.User user) async {
    final response = await http.post(
      "${baseUrl}places/user/",
      body: jsonEncode(user.toMap()),
      headers: {
        'content-type': 'application/json'
      }
    );

    final responseBody = jsonDecode(response.body);
    return responseBody;
  }

  Future<bool> selectPlace(int placeId, u.User user) async {
    final response = await http.post(
      "${baseUrl}places/select/$placeId",
      body: jsonEncode(user.toMap()),
      headers: {
        'content-type': 'application/json'
      }
    );

    final responseBody = jsonDecode(response.body);
    return responseBody;
  }

  Future<void> unselectPlace(int placeId) async {
    final response = await http.get(
      "${baseUrl}places/unselect/$placeId",
      headers: {
        'content-type': 'application/json'
      }
    );
  }

  Future<bool> bookOrder(Order order) async {
    final response = await http.post(
      "${baseUrl}orders/book/",
      body: jsonEncode(order.toMap()),
      headers: {
        'content-type': 'application/json'
      }
    );

    final responseBody = jsonDecode(response.body);
    return responseBody;
  }

  Future<void> unbookPlaces(List<int> placeIds) async {
    final response = await http.post(
      "${baseUrl}places/unbook/",
      body: jsonEncode(placeIds),
      headers: {
        'content-type': 'application/json'
      }
    );
  }

  Future<List> getOrders(u.User user) async {
    final response = await http.post(
      "${baseUrl}orders/user/",
      body: jsonEncode(user.toMap()),
      headers: {
        'content-type': 'application/json'
      }
    );

    final responseBody = jsonDecode(response.body);
    return responseBody;
  }

  Future<bool> payOrder(Order order) async {
    final response = await http.post(
      "${baseUrl}orders/pay/",
      body: jsonEncode(order.toMap()),
      headers: {
        'content-type': 'application/json'
      }
    );

    final responseBody = jsonDecode(response.body);
    return responseBody;
  }

  Future<bool> cancelOrder(Order order) async {
    final response = await http.post(
      "${baseUrl}orders/cancel/",
      body: jsonEncode(order.toMap()),
      headers: {
        'content-type': 'application/json'
      }
    );

    final responseBody = jsonDecode(response.body);
    return responseBody;
  }
}