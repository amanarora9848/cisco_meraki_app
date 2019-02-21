import 'package:flutter/material.dart';
//import '';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
//        primarySwatch: Colors.white,
      ),
      home: MyHomePage(title: 'Meraki'),
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
        title: Text(widget.title),
        centerTitle: true,
        elevation: 0.0,
      ),
//      body: Center(
//        child:
//        new Scaffold(
//          backgroundColor: Colors.white,
//          body: new Row(
//            children: <Widget>[
//              new Column(
//                children: <Widget>[
//                  new Align(
//                    heightFactor: 1.76,
//                    widthFactor: 1.76,
//                    child: Center(
//                      child: new Container(
//                        // child: new Image(image: AssetImage('/assets/images/images.png')),
//                        child: new GestureDetector(
//                            child: Icon(
//                              Icons.local_post_office,
//                              size: 110.0,
//                            ),
//                            onTap: () {
//                              //Do something
//                            }),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//              new Column(
//                children: <Widget>[
//                  new Align(
//                    heightFactor: 1.76,
//                    widthFactor: 1.76,
//                    child: Center(
//                      child: new Container(
//                        // child: new Image(image: AssetImage('/assets/images/images.png')),
//                        child: new GestureDetector(
//                            child: Icon(
//                              Icons.local_post_office,
//                              size: 110.0,
//                            ),
//                            onTap: () {
//                              //Do something
//                            }),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ],
//          ),
//        ),
//      ),
    backgroundColor: Colors.white,
    body: new GridView.extent(
        maxCrossAxisExtent: 240.0,
      children: _buildGridTiles(12),
    ),
      drawer: new Drawer(
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
              title: Text('Login'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                //Opens up the login page.

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
            )
          ],
        ),
      ),
    );
  }
}
List<Widget> _buildGridTiles(numberOfTiles) {
  List<Container> containers = new List<Container>.generate(numberOfTiles,
      (int index) {
      final iconName = index < 12 ? 'Tapping on image ${index+1} .' : 'N.A.';
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
                new Text('Hello World',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                )
              ],
            ),
            onTap: () {
              print(iconName);
            },
          ),
          
        );
      }
  );
  return containers;
}
