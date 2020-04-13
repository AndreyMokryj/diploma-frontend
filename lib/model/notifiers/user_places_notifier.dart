import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/model/place_model.dart';
import 'package:flutterappweb/model/user_model.dart';

class UserPlacesNotifier extends ChangeNotifier {
  User _user;
  get user => _user;
  List<int> _placeIds;
  get placeIds => _placeIds;

  void init(User user) async{
    _user = user;
    final placeMaps = await DBProvider.db.getPlacesForUser(user);
    final places = Place.getSortedFromMaps(placeMaps);
    _placeIds = [];
    for(Place p in places){
      _placeIds.add(p.id);
    }
    notifyListeners();
  }

  void addPlaceId(int placeId){
    _placeIds.add(placeId);
    notifyListeners();
  }

  void removePlaceId(int placeId){
    _placeIds.remove(placeId);
    notifyListeners();
  }

  void clearPlaceIds(){
    _placeIds = [];
    notifyListeners();
  }
}