import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterappweb/model/notifiers/login_notifier.dart';
import 'package:flutterappweb/views/login_page.dart';
import 'package:flutterappweb/views/main_view.dart';
import 'package:flutterappweb/views/signup_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MyApp()
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: globalLoginNotifier,
      child: MaterialApp(
        title: 'Кинотеатр FORMAT',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage(),
        initialRoute: '/',
        onGenerateRoute: _getRoute,
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  final String name;
  final int movieId;

  MainPage({Key key, this.name = "home", this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool loggedIn = Provider.of<LoginNotifier>(context, listen: false).loggedIn ?? false;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (!loggedIn) {
        Navigator.of(context).pushNamed("/login");
      }
    });
    if (loggedIn) {
      return MainView(
        name: name,
        movieId: movieId,
      );
    }
    else {
      return Container();
    }
  }
}

Route<dynamic> _getRoute(RouteSettings settings) {
  Widget page;
  final path = settings.name;
  if (path.startsWith('/details/')) {
    String id = path.substring(9);
    page = MainPage(
      name: 'details',
      movieId: int.tryParse(id),
    );
  }
  else {
    switch (path) {
      case '/' :
        page = MainPage(
          name: 'home',
        );
        break;
      case '/login' :
        globalLoginNotifier.logOut();
        page = LoginPage(
          created: ((settings.arguments ?? "") as String) == "created",
        );
        break;
      case '/signup' :
        globalLoginNotifier.logOut();
        page = SignupPage();
        break;
      case '/cart' :
        page = MainPage(
          name: 'cart',
        );
        break;
    }
  }

  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => Scaffold(body: page),
  );
}

final globalLoginNotifier = LoginNotifier();