import 'main.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'dart:async';
//import 'dart:math';

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

class _LoginPageState extends State<LoginPage>{

  String _status = 'no-action';

  //(Not to be removed in case the code goes wrong)

//  String _email, _password;
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => new Scaffold(
    resizeToAvoidBottomPadding: false,
//    appBar: new AppBar(
//      title: new Text(
//        'Login',
//        style: new TextStyle(
//          color: Colors.black,
//        ),
//      ),
//      centerTitle: true,
//      iconTheme: new IconThemeData(
//        color: Colors.black,
//      ),
//      backgroundColor: Colors.white,
//      elevation: 0.0,
//    ),
    backgroundColor: Colors.white,
    body: new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Image(
          image: new AssetImage(
            'assets/images/SBI_queue.png',
          ),
          fit: BoxFit.cover,
          color: Colors.black87,
          colorBlendMode: BlendMode.darken,
        ),
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: new AssetImage('assets/images/meraki_app_logo.png'),
              height: 125.0,
              width: 125.0,
            ),
            Text(
              'Cisco Meraki',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 3.5,
                wordSpacing: 4.0,
              ),
            ),
            new Form(
              child: Theme(
                data: new ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.green,
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle: new TextStyle(
                      color: Colors.green,
                      fontSize: 20.0,
                    )
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: new InputDecoration(
                          hintText: 'Enter your email',
                          labelText: 'E-mail'
                        ),
                        validator: (input) {
                          if(input.isEmpty) {
                            return "Email can't be empty";
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextFormField(
                        decoration: new InputDecoration(
                          hintText: 'Enter your Password',
                          labelText: 'Password',
                        ),
                        obscureText: true,
                        validator: (input) {
                          if(input.length < 8) {
                            return "Password must be at least 8 characters long";
                          }
                        },
                      ),
                      new Padding(padding: EdgeInsets.only(top: 20.0)),
                      new MaterialButton(
                        color: Colors.green,
                        minWidth: 100.0,
                        height: 40.0,
                        elevation: 20.0,
                        textColor: Colors.white,
                        child: new Text("Login", style: TextStyle(
                          fontSize: 18.0,
                        ),),
                        onPressed: () {
                          setState(() => this._status = 'loading');

                          appAuth.login().then((result) {
                            if (result) {
                              Navigator.of(context).pushReplacementNamed('/home');
                            } else {
                              setState(() => this._status = 'rejected');
                            }
                          });
                        },
                      ),
                      //CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    )
  );
//      new Form(
//        //TODO: implement key
//        key: _formKey,
//        child: new Column(
//          children: <Widget>[
//            //TODO: Implement fields
//            TextFormField(
//              validator: (input) {
//                if(input.isEmpty) {
//                  return 'Please type your Email.';
//                }
//              },
//              onSaved: (input) => _email = input,
//              decoration: InputDecoration(
//                labelText: 'Enter your e-mail',
//              ),
//            ),
//            TextFormField(
//              validator: (input) {
//                if(input.length < 5) {
//                  return 'Password needs to contain atleast 5 characters.';
//                }
//              },
//              onSaved: (input) => _password = input,
//              decoration: InputDecoration(
//                labelText: 'Enter your Password',
//              ),
//              obscureText: true,
//            ),
//            RaisedButton(
//              onPressed: () {
//                setState(() => this._status = 'loading');
//                signIn().then((result) {
//                if (result) {
//                  Navigator.of(context).pushReplacementNamed('/home');
//                } else {
//                  setState(() => this._status = 'rejected');
//                }
//              });
//              },
//              child: Text(
//                'Sign In',
//              ),
//            )
//          ],
//        ),
//      ),
//  );
//
//  Future<bool> signIn() async  {
//    bool st;
//    //TODO: validate fields
//    final _formState = _formKey.currentState;
//    if(_formState.validate()){
//      _formState.save();
//      //TODO: log into firebase.
//      try{
//        await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email , password: _password);
//        //TODO: navigate to home.
//        //Navigator.of(context).pushReplacementNamed('/home');
//        st = true;
//      }catch(e){
//        print(e.message);
//      }
//    }
//    else {
//      st = false;
//    }
//    return st;
//  }

}


