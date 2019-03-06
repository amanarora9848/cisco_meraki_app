import 'main.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:translator/translator.dart';
//import 'globals.dart' as globals;


void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPage(),
    );
  }
}

var selectedLanguageCode = '';
var oldLanguageCode = 'English';
Future<String> translate(String text, oldLanguageCode, selectedLanguageCode) async {
  GoogleTranslator translator = GoogleTranslator();
  var translatedLang = await translator.translate(text, from: oldLanguageCode, to: selectedLanguageCode);
  return translatedLang;
}

void selected(String l) {
  if(l == 'English') {
    selectedLanguageCode = 'en';
  }
  else if(l == 'Malayalam') {
    selectedLanguageCode = 'ml';
  }
  else if(l == 'Gujarati') {
    selectedLanguageCode = 'gu';
  }
  else if(l == 'Marathi') {
    selectedLanguageCode = 'mr';
  }
  else if(l == 'Tamil') {
    selectedLanguageCode = 'ta';
  }
  else if(l == 'Hindi') {
    selectedLanguageCode = 'hi';
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


// Platform messages may fail, so we use a try/catch PlatformException.
//  try {
//  currentLocation = await location.getLocation();
//  } on PlatformException {
//  currentLocation = null;
//}

//  GoogleTranslator translator = GoogleTranslator();
  String _status = 'no-action';
  String lang = "";
  var languages = ['English', 'മലയാളം', 'हिंदी', 'ગુજરતી', 'मराठी', 'தமிழ்'];
  var _currentItemSelected = 'English';
  var langCodes = ['en', 'ml', 'hi', 'gu', 'mr', 'ta'];



//(Not to be removed in case the code goes wrong)
//  String _email, _password;
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery
        .of(context)
        .size
        .width;
    var pageHeight = MediaQuery
        .of(context)
        .size
        .height;
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
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
                  height: 120.0,
                  width: 120.0,
                ),
                Text(
                  'Cisco Meraki View',
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            decoration: new InputDecoration(
                                hintText: 'Enter your email',
                                labelText: 'E-mail'
                            ),
                            validator: (input) {
                              if (input.isEmpty) {
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
                              if (input.length < 8) {
                                return "Password must be at least 8 characters long";
                              }
                            },
                          ),
                          new Padding(padding: EdgeInsets.only(top: 30.0)),
                          new MaterialButton(
                            color: Colors.green,
                            minWidth: 100.0,
                            height: 40.0,
                            elevation: 20.0,
                            textColor: Colors.white,
                            child: new Text(
                              "Login ($_status)", style: TextStyle(
                              fontSize: 16.0,
                            ),),
                            onPressed: () {
                              setState(() => this._status = 'loading');

                              appAuth.login().then((result) {
                                if (result) {
                                  Navigator.of(context).pushReplacementNamed(
                                      '/home');
                                } else {
                                  setState(() => this._status = 'rejected');
                                }
                              });
                            },
                          ),
                          //CircularProgressIndicator(),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Icon(
                                        Icons.language,
                                      ),
                                    ),
                                    DropdownButton<String>(
                                      elevation: 6,
                                      isDense: true,
                                      items: languages.map((
                                          String dropDownStringItem) {
                                        return DropdownMenuItem<String>(
                                          value: dropDownStringItem,
                                          child: Text(dropDownStringItem),
                                        );
                                      }).toList(),
                                      onChanged: (String newValueSelected) {
                                        setState(() {
                                          this._currentItemSelected =
                                              newValueSelected;
                                        });
                                      },
                                      value: _currentItemSelected,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
//        Navigator.of(context).pushReplacementNamed('/home');
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

}
