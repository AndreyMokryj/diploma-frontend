import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/helpers/constants.dart';
import 'package:flutterappweb/helpers/utils.dart';
import 'package:flutterappweb/views/menu_widget.dart';
import 'package:flutterappweb/views/panel_page.dart';
import 'package:flutterappweb/views/panels_list.dart';
import 'package:flutterappweb/views/station_page.dart';

class MainView extends StatelessWidget {
  final String name;
  final String panelId;

  const MainView({Key key, this.name, this.panelId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Object panel;
    String title;
    double w = getWidth(context);

    return WillPopScope(
      onWillPop: () {
        if (name != 'home') {
          Navigator.of(context).pop();
        }
      },
      child: FutureBuilder(
        future: panelId != null ? DBProvider.db.getPanel(panelId) : null,
        builder: (context, snapshot) {
          if (snapshot.hasData){
            panel = snapshot.data;
//            title = '${movie.name} / ${movie.nameOriginal}';
          }

          if (snapshot.hasData || panelId == null) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: panelId != null,
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
                              return PanelPage(
                                panel: panel,
                              );
                              break;
                            default:
                              return StationPage();
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