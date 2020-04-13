import 'package:flutter/material.dart';
import 'package:flutterappweb/helpers/constants.dart';
import 'package:flutterappweb/helpers/utils.dart';
import 'package:flutterappweb/model/movie_model.dart';
import 'package:flutterappweb/views/sessions_widget.dart';

class MoviePage extends StatelessWidget{
  final Movie movie;

  const MoviePage({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = getWidth(context);
    double h = getHeight(context);

    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(1),
            height: w > smallLimit ? h * 0.8 : null,
            width: w > smallLimit ? null : w * 0.9,
            child: Image.network(
              movie.imageLink,
              fit: w > smallLimit ? BoxFit.fitHeight : BoxFit.fitWidth,
            ),
          ),

          SizedBox(
            height: 20,
          ),
          Text(movie.description),
          SizedBox(
            height: 30,
          ),

          SessionsWidget(
            movie: movie,
          ),
        ],
      ),
    );
  }
}
