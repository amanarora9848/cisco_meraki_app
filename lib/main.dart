import 'package:flutter/material.dart';

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
      body: Center(
        child:
        new Scaffold(
          backgroundColor: Colors.white,
          body: new Row(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Align(
                    heightFactor: 1.76,
                    widthFactor: 1.76,
                    child: Center(
                      child: new Container(
                        // child: new Image(image: AssetImage('/assets/images/images.png')),
                        child: new GestureDetector(
                            child: Icon(
                              Icons.local_post_office,
                              size: 110.0,
                            ),
                            onTap: () {
                              //Do something
                            }),
                      ),
                    ),
                  ),
                ],
              ),
              new Column(
                children: <Widget>[
                  new Align(
                    heightFactor: 1.76,
                    widthFactor: 1.76,
                    child: Center(
                      child: new Container(
                        // child: new Image(image: AssetImage('/assets/images/images.png')),
                        child: new GestureDetector(
                            child: Icon(
                              Icons.local_post_office,
                              size: 110.0,
                            ),
                            onTap: () {
                              //Do something
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: new Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new DrawerHeader(
              child: Text('Name'),
              decoration: BoxDecoration(
                color: Colors.white,
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
