import 'package:flutter/material.dart';
import 'package:flutterappweb/model/movie_model.dart';

class MovieGrid extends StatelessWidget{
  final Movie movie;

  const MovieGrid({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: FlatButton(
        padding: EdgeInsets.zero,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.network(
                movie.imageLink,
                fit: BoxFit.fitHeight,
              )
            ),
            SizedBox(
              height: 5,
            ),
            Text("${movie.name} /\n${movie.nameOriginal}"),
          ],
        ),
        onPressed: (){
          Navigator.of(context).pushNamed('/details/${movie.id}');
        },
      ),
    );
  }
}