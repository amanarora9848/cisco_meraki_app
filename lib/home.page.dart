import 'package:flutter/material.dart';
import 'main.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return new Scaffold(
        drawer: new Drawer(
          elevation: 16.0,
          child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: Text("Aman Arora"),
                  accountEmail: Text("aman.arora9848@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.green
                        : Colors.white,
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
                new ListTile(
                  title: Text('Logout'),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () {
                    //Navigator.of(context).pushNamed("/EvalPage");
                    //Opens up the login page.
                    appAuth.logout().then(
                          (_) => Navigator.of(context).pushReplacementNamed('/login'),
                    );
                    //Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Settings'),
                  leading: Icon(Icons.settings),
                  onTap: () {
                    //Opens up the accounts page.
                    // Navigator.pop(context);
                  },
                ),
              ],
          ),
        ),
        body: MyHomePage(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: <Widget>[
            new IconButton( icon: new Icon(Icons.search, color: Colors.white,), tooltip: 'Air it',
//              onPressed: ,
            color: Colors.white,
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.green,
          title: new Text(
            'Cisco Meraki View',
            style: new TextStyle(
              color: Colors.white,
            ),
          )
        ),
      );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var pageHeight = MediaQuery.of(context).size.height;
    var pageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          height: pageHeight / 1.02,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: new ListView(
//              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: pageHeight / 13,
                  width: pageWidth / 1.05,
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Text(
                              'WHERE DO YOU WANT TO GO?',
                              style: new TextStyle(
                                color: Colors.red,
                                fontSize: 20.0,
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: pageHeight / 3.7,
                  width: pageWidth / 1.05,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.of(context).pushNamed("/EvalPage1");
                    },
                    child: Card(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: new Column(
                          children: <Widget>[
                            Image.asset('assets/images/images.jpeg', fit: BoxFit.fitWidth, height: pageHeight / 5,),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Banks near me',
                                style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 24.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: pageHeight / 3.7,
                  width: pageWidth / 1.05,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.of(context).pushNamed("/EvalPage1");
                    },
                    child: Card(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: new Column(
                          children: <Widget>[
                            Image.asset('assets/images/railways.jpeg', fit: BoxFit.fitWidth, height: pageHeight / 5,),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Railway Station',
                                style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 24.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: pageHeight / 3.7,
                  width: pageWidth / 1.05,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.of(context).pushNamed("/EvalPage1");
                    },
                    child: Card(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: new Column(
                          children: <Widget>[
                            Image.asset('assets/images/postoffice.png', fit: BoxFit.fitWidth, height: pageHeight / 5,),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Post Office',
                                style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 24.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: pageHeight / 3.7,
                  width: pageWidth / 1.05,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.of(context).pushNamed("/EvalPage1");
                    },
                    child: Card(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: new Column(
                          children: <Widget>[
                            Image.asset('assets/images/rto.png', fit: BoxFit.fitWidth, height: pageHeight / 5,),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'R.T.O. Office',
                                style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 24.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


//List<Widget> _buildGridTiles(numberOfTiles, BuildContext context) {
//  List<Container> containers = new List<Container>.generate(numberOfTiles,
//          (int index) {
//        final iconNo = index < 12 ? index : 0;
//        //index = 0, 1, 2,...
//        return new Container(
//          child:
//          // new Image.asset('assets/images/musk.jpeg'),
//          new GestureDetector(
//            behavior: HitTestBehavior.deferToChild,
//            child: Column(
//              children: <Widget>[
//                new Icon(
//                  Icons.local_post_office,
//                  size: 150.0,
//                ),
//                new Text('Hello World ${index+1}',
//                  style: TextStyle(
//                    fontSize: 15.0,
//                  ),
//                )
//              ],
//            ),
//            onTap: () {
//              //print(iconName);
//              Navigator.of(context).pushNamed("/EvalPage1");
//            },
//          ),
//        );
//      }
//  );
//  return containers;
//}
//
//
