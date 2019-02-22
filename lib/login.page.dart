import 'main.dart';
import 'package:flutter/material.dart';

void main() => runApp(Login());
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPage(),
    );
  }
}


class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _status = 'no-action';
  @override
  Widget build(BuildContext context) => new Scaffold(
    appBar: new AppBar(
      title: new Text(
        'Login',
        style: new TextStyle(
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      iconTheme: new IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
    ),
    backgroundColor: Colors.white,
    body: new Container(
      padding: const EdgeInsets.all(10.0),
      child: new Center(
        child: new RaisedButton(
            child: new Text(
                'Login for App (${this._status})',
                style: new TextStyle(
                  color: Colors.black,
                ),
            ),
            onPressed: () {
              setState(() => this._status = 'loading');

              appAuth.login().then((result) {
                if (result) {
                  Navigator.of(context).pushReplacementNamed('/home');
                } else {
                  setState(() => this._status = 'rejected');
                }
              });
            }
        ),
      ),
    ),
  );
}