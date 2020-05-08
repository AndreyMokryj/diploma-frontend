import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/helpers/constants.dart';
import 'package:flutterappweb/helpers/utils.dart';
import 'package:flutterappweb/model/movie_model.dart';
import 'package:flutterappweb/views/movie_grid.dart';

class StationPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double w = getWidth(context);
    int count = 1;
    if (w >= smallLimit) {
      count = 2;
    }
//    if (w >= mediumLimit) {
//      count = 3;
//    }

//    return FutureBuilder(
//      future: DBProvider.db.getMovies(),
//      builder:(context, snapshot) {
//        if (snapshot.hasData) {
//          final movieMaps = snapshot.data as List;
//          return Container(
//            padding: EdgeInsets.all(5),
//            child: GridView.count(
//              crossAxisSpacing: 5,
//              mainAxisSpacing: 25,
//              crossAxisCount: count,
//              childAspectRatio: 0.8,
//              children: movieMaps.map((e) => MovieGrid(
//                movie: Movie.fromMap(e),
//              )).toList(),
//            ),
//          );
//        }
//        else {
//          return Container();
//        }
//      }
//    );
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Image.asset(
                  "assets/images/panels.png",
                ),
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/switch/h_switch_on.png",
                ),
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/accumulator.png",
                ),
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/switch/h_switch_on.png",
                ),
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/grid.png",
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}