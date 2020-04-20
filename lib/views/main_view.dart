import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/helpers/constants.dart';
import 'package:flutterappweb/helpers/utils.dart';
import 'package:flutterappweb/model/movie_model.dart';
import 'package:flutterappweb/views/menu_widget.dart';
import 'package:flutterappweb/views/movie_page.dart';
import 'package:flutterappweb/views/panels_list.dart';
import 'package:flutterappweb/views/movie_list.dart';

class MainView extends StatelessWidget {
  final String name;
  final int movieId;

  const MainView({Key key, this.name, this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Movie movie;
    String title;
    double w = getWidth(context);

    return WillPopScope(
      onWillPop: () {
        if (name != 'home') {
          Navigator.of(context).pop();
        }
      },
      child: FutureBuilder(
        future: movieId != null ? DBProvider.db.getMovie(movieId) : null,
        builder: (context, snapshot) {
          if (snapshot.hasData){
            movie = snapshot.data;
            title = '${movie.name} / ${movie.nameOriginal}';
          }

          if (snapshot.hasData || movieId == null) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: movieId != null,
//                automaticallyImplyLeading: false,
                title: Text(title ?? pageNames[name]),
                centerTitle: true,
                actions: <Widget>[
                  w <= largeLimit ?
                  Builder(
                    builder: (context) => IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: (){
                        Scaffold.of(context).openEndDrawer();
                      },
                    ),
                  ) : Container(),
                ],
              ),
              body: Row(
                children: <Widget>[
                  w > largeLimit ?
                  Expanded(
                    flex: 1,
                    child: MenuWidget(),
                  ) : Container(),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Builder(
                        builder: (context) {
                          switch (name) {
                            case 'panels':
                              return PanelsList();
                              break;
                            case 'details':
                              return MoviePage(
                                movie: movie,
                              );
                              break;
                            default:
                              return MovieList();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),

              endDrawer: w <= largeLimit ? Drawer(
                child: MenuWidget(),
              ) : null,
            );
          }
          else{
            return Container();
          }
        }
      ),
    );
  }
}