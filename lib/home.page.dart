import 'package:flutter/material.dart';
import 'main.dart';

//import 'login.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primaryColor: Colors.white,
//        primarySwatch: Colors.white,
//      ),
//      home: MyHomePage(title: 'Meraki'),
//      routes: <String, WidgetBuilder> {
//        // "/": (BuildContext context) => new MyApp(),
//        "/EvalPage1": (BuildContext context) => new EvalPage(),
//        //"/login": (BuildContext context) => Login(),
//      },
//    );
      return new Scaffold(
        body: MyHomePage(),
      );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meraki',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: new IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: new GridView.extent(
        maxCrossAxisExtent: 240.0,
        children: _buildGridTiles(8, context),
      ),
      drawer: new Drawer(
            elevation: 10.0,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                new DrawerHeader(
                  child: Center(
                    child: new Text(
                      'Elon Musk',
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: new DecorationImage(image: AssetImage(
                      'assets/images/musk.jpeg',
                    ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                ListTile(
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
    );
  }
}
List<Widget> _buildGridTiles(numberOfTiles, BuildContext context) {
  List<Container> containers = new List<Container>.generate(numberOfTiles,
          (int index) {
        final iconNo = index < 12 ? index : 0;
        //index = 0, 1, 2,...
        return new Container(
          child:
          // new Image.asset('assets/images/musk.jpeg'),
          new GestureDetector(
            child: Column(
              children: <Widget>[
                new Icon(
                  Icons.local_post_office,
                  size: 150.0,
                ),
                new Text('Hello World ${index+1}',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                )
              ],
            ),
            onTap: () {
              //print(iconName);
              Navigator.of(context).pushNamed("/EvalPage${iconNo+1}");
            },
          ),
        );
      }
  );
  return containers;
}