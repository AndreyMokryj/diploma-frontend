import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/model/notifiers/user_places_notifier.dart';
import 'package:provider/provider.dart';

void clearSelPlaces(BuildContext context) async{
  final placeIds = Provider.of<UserPlacesNotifier>(context, listen: false).placeIds;
  if(placeIds?.length > 0 ?? false) {
    await DBProvider.db.unbookPlaces(placeIds);
  }
  Provider.of<UserPlacesNotifier>(context, listen: false).clearPlaceIds();
}

double getWidth(BuildContext context) => MediaQuery.of(context).size.width;
double getHeight(BuildContext context) => MediaQuery.of(context).size.height;