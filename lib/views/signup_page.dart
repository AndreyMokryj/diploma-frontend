import 'package:flutter/material.dart';
import 'package:flutterappweb/database/database.dart';
import 'package:flutterappweb/helpers/constants.dart';
import 'package:flutterappweb/helpers/styles.dart';
import 'package:flutterappweb/helpers/utils.dart';
import 'package:flutterappweb/model/user_model.dart';

class SignupPage extends StatefulWidget{
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  User newUser = User();
  bool validate;
  String errorMsg;

  @override
  void initState() {
    validate = false;
    errorMsg = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = getWidth(context);

    return Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                  width: w > smallLimit ? 500 : w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text('Введите имя пользователя и пароль',
                        style: normalTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12.0),
                      TextFormField(
                        style: fieldTextStyle,
                        enabled: true,
                        decoration: AppDecoration(
                          labelText: "Имя пользователя",
                          hintText: "Имя пользователя",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) => val.isEmpty ? "Введите имя пользователя" :
                          val.length < 5 ? "Должно содержать минимум 5 символов" : null,
                        autovalidate: validate,
                        onSaved: (val) => newUser.username = val,
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        style: fieldTextStyle,
                        enabled: true,
                        decoration: AppDecoration(
                          labelText: 'Пароль',
                          hintText: 'Пароль для входа'
                        ),
                        obscureText: true,
                        validator: (val) => val.isEmpty ? "Введите пароль" :
                        val.length < 5 ? "Должно содержать минимум 5 символов" : null,
                        autovalidate: validate,
                        onSaved: (val) => newUser.password = val,
                      ),

                      SizedBox(height: 15.0),
                      Text(
                        errorMsg,
                        style: errorTextStyle,
                      ),
                      SizedBox(height: 15.0),

                      FlatButton(
                        child: Text(
                          'Зарегистрироваться'
                        ),
                        onPressed: () {
                          _submit();
                        }
                      ),
                    ],
                  ),
                ),
              ))
          ),
        ),
      );
  }

  void _submit() async {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      if (await DBProvider.db.newUser(newUser)) {
        Navigator.of(context).pushNamed('/login', arguments: "created");
      }
      else {
        setState(() {
          errorMsg = "Это имя пользователя занято. Попробуйте другое";
        });
      }
    }
    else {
      setState(() {
        validate = true;
      });
    }
  }
}